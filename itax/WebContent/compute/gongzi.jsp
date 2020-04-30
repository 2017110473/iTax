<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort() + path + "/";
%>

<!--
     工资所得税计算页面
     功能：进行工资所得的所得税计算，展示相关数据

     输入: 税前月薪、
          所在城市、
          专项扣除额

     输出：五险一金(参数、基数、合计)
           起征点、应纳税所得额、适用税率、速算扣除数、应纳税额、税后工资

     其他功能：可根据自己的情况调整五险一金参数

     完成情况：张秋菊完成页面设计、董嘉懿完成相关计算。  
-->
<!DOCTYPE html>

<head>
    <!-- Metas -->
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="" />
    <!-- Links -->
    <link rel="shortcut icon" type="image/png" href="../images/favicon.png" />
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <link href="../css/icofont.min.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/slick.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
    <!-- Document Title -->
    <title>iTax | 个税小帮手</title>
</head>


<body>
    <!-- HEADER SECTION -->
    <header id="home">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light ">
                <!-- Change Logo Img Here -->
                <a class="navbar-brand" href="#"><img src="../images/logo.svg" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <div class="interactive-menu-button">
                        <a href="#">
                            <span>Menu</span>
                        </a>
                    </div>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                            <!-- Nav Link -->
                            <a class="nav-link" data-scroll href="../index.jsp">主页</a>
                        </li>
                        <li class="nav-item dropdown active">
                            <!-- Nav Link -->
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">个税计算</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <!-- Lang Dropdown Choice -->
                                <a class="dropdown-item" data-scroll href="gongzi.jsp">工资薪金 </a>
                                <a class="dropdown-item" data-scroll href="nianzhongjiang.jsp">年终奖 </a>
                                <a class="dropdown-item" data-scroll href="laowu.jsp">劳务报酬 </a>
                                <a class="dropdown-item" data-scroll href="gaochou.jsp">稿酬所得 </a>
                                <a class="dropdown-item" data-scroll href="texu.jsp">特许使用 </a>
                                <a class="dropdown-item" data-scroll href="jingying.jsp">经营所得 </a>
                                <a class="dropdown-item" data-scroll href="qita.jsp">其他所得 </a>
                            </div>
                        <li class="nav-item dropdown">
                            <!-- Nav Link -->
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">个税对比</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <!-- Dropdown Choice -->
                                <a class="dropdown-item" data-scroll href="../comparison/salary.jsp">薪资对比 </a>
                                <a class="dropdown-item" data-scroll href="../comparison/final.jsp">汇算对比 </a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">个税优化</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <!-- Dropdown Choice -->
                                <a class="dropdown-item" data-scroll href="../optimizing/forsalary.jsp">薪资优化 </a>
                                <a class="dropdown-item" data-scroll href="../optimizing/forhome.jsp">家庭优化 </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!-- TOP SECTION -->
    <div class="container-fluid aboutimg">
        <img src="../images/aboutimg.svg" alt="">
        <div class="container">

		<!-- TOP Title -->
     	 	<h2>工资薪金</h2>
      		<p>纳税额 =应纳税所得额  * 税率 - 速算扣除数 - 累计已缴纳税额
            <br />
           	应纳税所得额 = 累计税前收入 - 累计五险一金 - 累计专项扣除 - 累计起征点
          	<br />       
                     税后工资 = 税前工资 - 五险一金个人缴纳额 - 纳税额    
            </p>
        </div>
    </div>

    <!--  SECTION -->
    <section id="input" class="inputs">

        <div class="side-img">
            <img src="../images/aside3.svg" alt="" style="height:950px">
        </div>

        <div class="container">
            <div class="layui-tab">
                <ul class="layui-tab-title">
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <form class="layui-form" action="" lay-filter="info">
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="margin-left: 35px;">本月税前工资：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 17px;">
                                    <input type="number" name="salary" lay-verify="required|number" placeholder="请输入金额"
                                        autocomplete="off" class="layui-input">
                                    <span class="unit">元</span>
                                </div>
                                <label class="layui-form-label" style="margin-left: 60px;">每月五险一金：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 10px;">
                                    <input type="text" name="socialIns" autocomplete="off" class="layui-input"
                                        disabled="" style="background:transparent">
                                    <span class="unit">元</span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="margin-left: 35px;">所在地：</label>
                                <div class="layui-input-block" id="citydata"
                                    style="width: 200px; float: left;margin-left: 17px;">
                                </div>
                                <script type="text/html" id="city-select">
									<select name="city" lay-filter="city" lay-verify="required">
										<option value="" selected="">请选择省会城市</option>
                    					{{each data value i}}
                    					<option value="{{value.region}}">{{value.region}}</option>
                    					{{/each}}
                   					</select>
               					</script>
                                <label class="layui-form-label" style="margin-left: 60px; ">起征点（免征额）：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 10px;">
                                    <input type="text" name="start" autocomplete="off" class="layui-input" disabled="" style="background:transparent">
                                    <span class="unit">元</span>
                                </div>

                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="margin-left: 35px;">期数：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 17px;">
                                    <input type="number" name="month" lay-verify="required" placeholder="1~12"
                                        autocomplete="off" class="layui-input">
                                </div>
                                <label class="layui-form-label" style="margin-left: 60px; ">应纳税所得额：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 10px;">
                                    <input type="text" name="taxable_income" autocomplete="off" class="layui-input"
                                        disabled="" style="background:transparent">
                                    <span class="unit">元</span>
                                </div>

                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="margin-left: 35px;">专项附加扣除：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 17px;">
                                    <input type="number" name="special" lay-verify="required" placeholder="请输入金额"
                                        autocomplete="off" class="layui-input">
                                    <span class="unit">元</span>
                                </div>
                                <label class="layui-form-label" style="margin-left: 60px; ">适用税率：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 10px;">
                                    <input type="text" name="tax" autocomplete="off" class="layui-input" disabled="" style="background:transparent">
                                    <span class="unit">%</span>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 17px;">
                                    <button class="layui-btn" lay-submit lay-filter="compute"
                                        style="margin-left: 240px;width: 100px;">计算</button>
                                </div>
                                <label class="layui-form-label" style="margin-left: 295px; ">速算扣除数：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 10px;">
                                    <input type="text" name="deduction" autocomplete="off" class="layui-input"
                                        disabled="" style="background:transparent">
                                    <span class="unit">元</span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="margin-left: 50px;">五险一金缴纳：</label>
                                <label class="layui-form-label" style="margin-left: -130px; font-size: 15px;">比例</label>
                                <label class="layui-form-label" style="margin-left: -100px; font-size: 15px;">基数</label>
                                <label class="layui-form-label" style="margin-left: 93px; ">累计应纳税额：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 10px;">
                                    <input type="text" name="Ctax_value" autocomplete="off" class="layui-input"
                                        disabled="" style="background:transparent">
                                    <span class="unit">元</span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label"
                                    style="margin-left: 50px;margin-top: -5px; padding: 1px 15px;">养老：</label>
                                <div class="layui-input-block"
                                    style="width: 200px;margin-left: 0px;margin-top:-5px; float: left;">
                                    <input type="number" name="pensionRate" lay-verify="required" autocomplete="off"
                                        class="layui-input"
                                        style="width: 50px;height: 25px; margin-left: 18px; padding-left: 5px;">
                                    <span class="unit">%</span>
                                    <input type="number" name="pensionBase" lay-verify="required" autocomplete="off"
                                        class="layui-input"
                                        style="width: 70px;;height: 25px; margin-left: 20px;padding-left: 5px;">
                                    <span class="unit">元</span>
                                </div>
                                <label class="layui-form-label" style="margin-left: 63px; ">已纳税额：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 10px;">
                                    <input type="text" name="Ptax_value" autocomplete="off" class="layui-input"
                                        disabled="" style="background:transparent">
                                    <span class="unit">元</span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="margin-left: 50px;margin-top: -18px;">医疗：</label>
                                <div class="layui-input-block"
                                    style="width: 200px;margin-left: 0px;margin-top: -13px; float: left;">
                                    <input type="number" name="medRate" lay-verify="required" autocomplete="off"
                                        class="layui-input"
                                        style="width: 50px;height: 25px; margin-left: 18px; padding-left: 5px;">
                                    <span class="unit">%</span>
                                    <input type="number" name="medBase" lay-verify="required" autocomplete="off"
                                        class="layui-input"
                                        style="width: 70px;;height: 25px; margin-left: 20px; padding-left: 5px;">
                                    <span class="unit">元</span>
                                </div>
                                <label class="layui-form-label" style="margin-left: 63px; ">应补（退）税额：</label>
                                <div class="layui-input-block" style="width: 200px;float: left ;margin-left: 10px;">
                                    <input type="text" name="tax_value" autocomplete="off" class="layui-input"
                                        disabled="" style="background:transparent">
                                    <span class="unit">元</span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="margin-left: 50px;margin-top: -27px;">失业：</label>
                                <div class="layui-input-block"
                                    style="width: 200px;margin-left: 0px;margin-top: -22px; float: left;">
                                    <input type="number" name="unempRate" lay-verify="required" autocomplete="off"
                                        class="layui-input"
                                        style="width: 50px;height: 25px; margin-left: 18px; padding-left: 5px;">
                                    <span class="unit">%</span>
                                    <input type="number" name="unempBase" lay-verify="required" autocomplete="off"
                                        class="layui-input"
                                        style="width: 70px;;height: 25px; margin-left: 20px; padding-left: 5px;">
                                    <span class="unit">元</span>
                                </div>
                                <label class="layui-form-label" style="margin-left: 63px; ">税后工资：</label>
                                <div class="layui-input-block" style="width: 200px; float: left;margin-left: 10px;">
                                    <input type="text" name="after_salary" autocomplete="off" class="layui-input"
                                        disabled="" style="background:transparent">
                                    <span class="unit">元</span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label"
                                    style="margin-left: 50px;margin-top: -40px;">公积金：</label>
                                <div class="layui-input-block"
                                    style="width: 200px;margin-left: 0px;margin-top: -30px; float: left;">
                                    <input type="number" name="houseRate" lay-verify="required" autocomplete="off"
                                        class="layui-input"
                                        style="width: 50px;height: 25px; margin-left: 18px;padding-left: 5px;">
                                    <span class="unit">%</span>
                                    <input type="number" name="houseBase" lay-verify="required" autocomplete="off"
                                        class="layui-input"
                                        style="width: 70px;;height: 25px; margin-left: 20px; padding-left: 5px;">
                                    <span class="unit">元</span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block" style="margin-left: 210px; margin-top: -20px;">
                                    <label class="input-label layui-form-label"
                                        style="font-size: 13px;margin-left:-140px; padding:8px 0;width:200px">1.可进行局部参数调整。</label>
                                    <label class="input-label layui-form-label"
                                        style="font-size: 13px;margin-left:-60px; padding:8px 0;width:200px">2.填写税前工资之后：</label>
                                    <input type="submit" id="changeParameter" data-type="auto" value="更新参数"
                                        style="background-color: #FFFFFF; color: #6C757D; border: 1px solid #ededef;border-radius: 4px; font-size: 13px; width: 80px;padding:0 0 ;margin:8px 0;"
                                        class="layui-btn layui-btn-primary layui-btn-xs">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <footer style="margin-top: 50px;">
        <div class=" container">
            <div class="row">
                <div class="col-12">
                    <h5>iTax</h5>
                    <h4>个税小帮手</h4>
                    <ul class="contact-nav">
                        <li><a data-scroll href="#home">返回开始</a></li>
                    </ul>
                    <h6>© 2020 - iTax, for all.</h6>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/slick.min.js"></script>
    <script src="../js/smooth-scroll.min.js"></script>
    <script src="../js/main.js"></script>
    <script src="../layui/layui.js" charset="utf-8"></script>
    <script src="../js/jquery.js"></script>
    <script src="../js/template.js"></script>
    <!-- Scripts Ends -->
    <script>
        layui.use('form', function () {
            var form = layui.form;
            //渲染表格
            form.render();

            //选择城市时获取社保数据
            form.on('select(city)', function (data) {
                var region = data.value;
                updateParameter(region);
            });

            //更新参数
            $('#changeParameter').on('click', function (e) {
                if (form.val('info').city == "") {
                    layer.msg("请选择城市！");
                } else if (parseFloat(form.val('info').salary) >= 0) {
                    updateParameter(form.val('info').city);
                } else {
                    layer.msg("请填写正确的数据！");
                }
                e.preventDefault();
            });

            //提交信息开始计算
            form.on('submit(compute)', function () {
                var info = form.val('info');
                if (parseFloat(info.salary) >= 0 && parseFloat(info.special) >= 0 && parseFloat(info.month) >= 0 && parseFloat(info.month) <= 12) {
                    if (parseFloat(info.pensionRate) >= 0 && parseFloat(info.pensionBase) >= 0 &&
                        parseFloat(info.medRate) >= 0 && parseFloat(info.medBase) >= 0 &&
                        parseFloat(info.unempRate) >= 0 && parseFloat(info.unempBase) >= 0 &&
                        parseFloat(info.houseRate) >= 0 && parseFloat(info.houseBase) >= 0) {
                        computeIns();
                        computeTax();
                        return false;
                    }
                } else {
                    layer.msg("请填写正确的数据");
                    return false;
                }
            });

            //参数更新函数
            function updateParameter(data) {
                if (form.val('info').salary == "") {
                    layer.msg("请填写税前工资后更新参数！");
                    return false;
                }
                var region = data;
                $.ajax({
                    url: "<%=basePath%>selectByRegion",
                    data: {
                        region: region,
                    },
                    type: "post",
                    async: false,
                    success: function (data) {
                        var salary = parseFloat(form.val('info').salary);
                        var pensionRate = data.pension.substring(0, data.pension.length - 1);
                        var pensionBase;
                        var medRate = data.med.substring(0, data.med.length - 1);
                        var medBase;
                        var unempRate = data.unemp.substring(0, data.unemp.length - 1);
                        var unempBase;
                        var houseRate = data.house.substring(0, data.house.length - 1);
                        var houseBase;

                        //养老基数
                        if (salary < parseFloat(data.lpension)) pensionBase = parseFloat(data.lpension);
                        else if (salary > parseFloat(data.upension)) pensionBase = parseFloat(data.upension);
                        else pensionBase = salary;
                        //医疗基数
                        if (salary < parseFloat(data.lmed)) medBase = parseFloat(data.lmed);
                        else if (salary > parseFloat(data.umed)) medBase = parseFloat(data.umed);
                        else medBase = salary;
                        //失业基数
                        if (salary < parseFloat(data.lunemp)) unempBase = parseFloat(data.lunemp);
                        else if (salary > parseFloat(data.uunemp)) unempBase = parseFloat(data.uunemp);
                        else unempBase = salary;
                        //公积金基数
                        if (salary < parseFloat(data.lhouse)) houseBase = parseFloat(data.lhouse);
                        else if (salary > parseFloat(data.uhouse)) houseBase = parseFloat(data.uhouse);
                        else houseBase = salary;

                        form.val('info', {
                            "pensionRate": pensionRate,
                            "medRate": medRate,
                            "unempRate": unempRate,
                            "houseRate": houseRate,
                            "pensionBase": pensionBase,
                            "medBase": medBase,
                            "unempBase": unempBase,
                            "houseBase": houseBase,
                        });
                        computeIns();

                    }, error: function (data) {
                        alert("error");
                    }
                });
            }

            //五险一金计算函数
            function computeIns() {
                var info = form.val('info');
                var ins = parseFloat(info.pensionRate) * parseFloat(info.pensionBase)
                    + parseFloat(info.medRate) * parseFloat(info.medBase)
                    + parseFloat(info.unempRate) * parseFloat(info.unempBase)
                    + parseFloat(info.houseRate) * parseFloat(info.houseBase);
                form.val('info', {
                    "socialIns": Math.round(ins) / 100,
                });
            }

            //税率计算函数
            function computeTax() {
                var info = form.val('info');
                var cur, post;
                var start = 5000; //起征点
                $.ajax({
                    url: "<%=basePath%>taxForSalary",
                    data: {
                        preSalary: info.salary,
                        socialIns: info.socialIns,
                        special: info.special,
                        start: start,
                        month: info.month,
                    },
                    type: "post",
                    async: false,
                    success: function (data) {
                        cur = data;
                    },
                    error: function (data) {
                        alert("error");
                    }
                })

                $.ajax({
                    url: "<%=basePath%>taxForSalary",
                    data: {
                        preSalary: info.salary,
                        socialIns: info.socialIns,
                        special: info.special,
                        start: start,
                        month: parseInt(info.month) - 1,
                    },
                    type: "post",
                    async: false,
                    success: function (data) {
                        post = data;
                    },
                    error: function (data) {
                        alert("error");
                    }
                })

                form.val('info', {
                   	"start": parseInt(info.month) * start,
                    "deduction": cur.deduction.toFixed(2),
                    "Ctax_value": cur.tax_value.toFixed(2),
                    "Ptax_value": post.tax_value.toFixed(2),
                    "tax_value": (cur.tax_value - post.tax_value).toFixed(2),
                    "tax": parseFloat(cur.tax) * 100,
                    "taxable_income": parseFloat(cur.taxable_income).toFixed(2),
                    "after_salary": (parseFloat(info.salary) - info.socialIns - (cur.tax_value - post.tax_value)).toFixed(2),
                });
            }
        });

        //提取城市数据
        function updateData() {
            $.ajax({
                url: "<%=basePath%>region",
                type: "post",
                async: false,
                success: function (data) {
                    console.log(data);
                    $("#citydata").append(template("city-select", { data: data }));
                },
                error: function (data) {
                    alert("error");
                }
            })
        }

        updateData();
    </script>

</body>

</html>