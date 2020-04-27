<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort() + path + "/";
%>
<!--
     薪资优化页面
     功能：对工资、年终奖进行优化，在全年税前收入不变的情况下，使得纳税额最少

     输入: 工资所得、年终奖、五险一金个人缴纳额、专项扣除

     输出：优化情况

     辅助功能：可按地区计算五险一金个人缴纳额

     完成情况：董嘉懿完成
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
    <link href="../css/icofont.min.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/slick.css" rel="stylesheet" />
    <link href="../layui/css/layui-1.css" rel="stylesheet" media="all">
    <link href="../css/main.css" rel="stylesheet" />
    <link href="../css/optimizing.css" rel="stylesheet" />
    <!-- Document Title -->
    <title>iTax | 个税优化</title>
</head>

<body>
    <!-- HEADER SECTION -->
    <header id="home">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light ">
                <!-- Change Logo Img Here -->
                <a class="navbar-brand" href="#"><img src="../images/logo.svg" alt=""></a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <!-- Nav Link -->
                            <a class="nav-link" data-scroll href="../index.jsp">主页<span
                                    class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <!-- Nav Link -->
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">个税计算</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <!-- Dropdown Choice -->
                                <a class="dropdown-item" data-scroll href="../compute/gongzi.jsp">工资薪金 </a>
                                <a class="dropdown-item" data-scroll href="../compute/nianzhongjiang.jsp">年终奖 </a>
                                <a class="dropdown-item" data-scroll href="../compute/laowu.jsp">劳务报酬 </a>
                                <a class="dropdown-item" data-scroll href="../compute/gaochou.jsp">稿酬所得 </a>
                                <a class="dropdown-item" data-scroll href="../compute/texu.jsp">特许使用 </a>
                                <a class="dropdown-item" data-scroll href="../compute/jingying.jsp">经营所得 </a>
                                <a class="dropdown-item" data-scroll href="../compute/qita.jsp">其他所得 </a>
                            </div>
                        </li>
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
                        <li class="nav-item dropdown active">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">个税优化</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <!-- Dropdown Choice -->
                                <a class="dropdown-item" data-scroll href="forsalary.jsp">薪资优化 </a>
                                <a class="dropdown-item" data-scroll href="forhome.jsp">家庭优化 </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!-- 标题 -->
    <div class="container-fluid aboutimg">
        <img src="../images/aboutimg.svg" alt="">
        <div class="container">
            <!-- Top Title -->
            <h2>薪资优化</h2>
            <!-- Top Title Info -->
            <p>同等税前收入下，如何分配月工资和年终奖纳税额最少？
                <br />
            </p>
        </div>
    </div>


    <!-- INPUTS SECTION -->
    <section id="input" class="inputs">

        <div class="side-img">
            <img src="../images/aside3.svg" alt="">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-6 col-lg-6">
                    <div class="input-box">
                        <!-- Title -->
                        <h3>个人薪金信息清单</h3>
                        <!-- Replace Patch to Image Under -->
                        <div class="in-box">

                            <form class=" layui-form" action="" lay-filter="info" style="margin-top:30px">
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">税前薪金</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="salary" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">年终奖金</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="bonus" placeholder="按年填写" autocomplete="off"
                                            class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">社会保险</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="socialIns" placeholder="按月填写" autocomplete="off"
                                            class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                    <label class="input-label layui-form-label"
                                        style="font-size: 10px;">填写税前工资之后：</label>
                                    <button data-method="insurance" data-type="auto" type="button"
                                        class="layui-btn layui-btn-primary layui-btn-xs" lay-submit
                                        lay-filter="insuranceBtn" style="margin-top: 8px; margin-left:-7px;"
                                        id="insurance">计算社会保险</button>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">专项扣除</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="special" placeholder="按月填写" autocomplete="off"
                                            class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--优化按钮-->
                    <div class="hero-btns input-btn">
                        <a id="optimazation">进行优化</a>
                    </div>
                </div>
                <!--结果-->
                <div class="col-12 col-sm-6 col-lg-6">
                    <div class="block">
                        <h3>优化结果</h3>
                        <div>
                            <table class="layui-table" lay-size="lg" id="result">
                                <colgroup>
                                    <col>
                                    <col width="100">
                                    <col width="100">
                                    <col width="100">
                                </colgroup>

                            </table>
                        </div>
                        <!--图形展示-->
                        <div>
                            <div id="echart-area" style="width:100%;height:300px; margin-top:80px"> </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
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

    <!--弹出框-->
    <div class="in-box" id="hidden-area" style="padding: 10px;">
        <!-- 城市选择 -->
        <form class="layui-form" action="" lay-filter="selectCity">
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label">选择城市</label>
                <div class="layui-input-block" id="citydata">
                </div>
                <script type="text/html" id="city-select">
					<select name="city"  lay-filter="city" lay-search="">
						<option value="0" selected="">请选择或搜索省会城市</option>
                    {{each data value i}}
                    	<option value="{{value.region}}">{{value.region}}</option>
                    {{/each}}
                    </select>
               		</script>
            </div>
        </form>

        <!-- 社会保险相关信息 -->
        <form class=" layui-form" action="" lay-filter="ins">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label" style="font-weight:bolder;">五险一金:</label>
                <label class="layui-form-label" style="margin-left:-30px;">比例</label>
                <label class="layui-form-label" style="margin-left:-50px;">基数</label>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">养老</label>
                <div class="layui-input-block">
                    <input type="text" name="pensionRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="pensionBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">医疗</label>
                <div class="layui-input-block">
                    <input type="text" name="medRate" placeholder="" autocomplete="off" class="layui-input changeable"
                        style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="medBase" placeholder="" autocomplete="off" class="layui-input changeable"
                        style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label ">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">失业</label>
                <div class="layui-input-block">
                    <input type="text" name="unempRate" placeholder="" autocomplete="off" class="layui-input changeable"
                        style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="unempBase" placeholder="" autocomplete="off" class="layui-input changeable"
                        style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">公积金</label>
                <div class="layui-input-block">
                    <input type="text" name="houseRate" placeholder="" autocomplete="off" class="layui-input changeable"
                        style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="houseBase" placeholder="" autocomplete="off" class="layui-input changeable"
                        style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
        </form>
    </div>

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
    <script src="https://cdn.bootcss.com/echarts/3.7.2/echarts.min.js"></script>

    <script>
        layui.use(['form', 'layer', 'table'], function () {
            var form = layui.form, $ = layui.jquery, layer = layui.layer, table = layui.table;
            form.render();
            $("#hidden-area").hide();
            //结果表格
            table.render({
                elem: '#result'
                , cols: [[ //标题栏
                    { field: 'title', title: '',align: 'center'  }
                    , { field: 'pre', title: '原方案' ,align: 'center'  }
                    , { field: 'change', title: '调整' ,align: 'center'  }
                    , { field: 'after', title: '优化方案',align: 'center'  }
                ]]
                , data: [{
                    "title": "月工资",
                    "pre": "",
                    "change": "",
                    "after": ""
                }, {
                    "title": "年终奖",
                    "pre": "",
                    "change": "",
                    "after": ""
                }, {
                    "title": "年纳税额",
                    "pre": "",
                    "change": "",
                    "after": ""
                }]
            });

            //选择城市
            form.on('select(city)', function (data) {
                var region = data.value;
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

                        form.val('ins', {
                            "pensionRate": pensionRate,
                            "medRate": medRate,
                            "unempRate": unempRate,
                            "houseRate": houseRate,
                            "pensionBase": pensionBase,
                            "medBase": medBase,
                            "unempBase": unempBase,
                            "houseBase": houseBase,
                        });
                    },
                    error: function (data) {
                        alert("error");
                    }
                })
            });


            //弹出框触发事件
            var active = {
                insurance: function (othis) {
                    layer.open({
                        type: 1
                        , title: '计算社会保险个人缴纳部分'
                        , area: '460px;'
                        , shade: 0.3
                        , id: 'LAY_insurance' //防止重复弹出
                        , content: $("#hidden-area")
                        , btn: ['确定', '重置']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            var ins = form.val('ins');
                            if (ins.pensionRate == "" || ins.pensionBase == "" || ins.medRate == "" || ins.medBase == "" ||
                                ins.unempRate == "" || ins.unempRate == "" || ins.houseRate == "" || ins.houseBase == "") {
                                if (form.val('selectCity').city == "0") {
                                    layer.msg("请选择省会城市！");
                                }
                                layer.msg("请选择比例与基数！");
                            } else if (parseFloat(ins.pensionRate) >= 0 && parseFloat(ins.pensionBase) >= 0 && parseFloat(ins.medRate) >= 0 && parseFloat(ins.medBase) >= 0 &&
                                parseFloat(ins.unempRate) >= 0 && parseFloat(ins.unempRate) >= 0 && parseFloat(ins.houseRate) >= 0 || parseFloat(ins.houseBase) >= 0) {
                                
                                var insurance = parseFloat(ins.pensionRate) * parseFloat(ins.pensionBase)
                                    + parseFloat(ins.medRate) * parseFloat(ins.medBase)
                                    + parseFloat(ins.unempRate) * parseFloat(ins.unempBase)
                                    + parseFloat(ins.houseRate) * parseFloat(ins.houseBase);
                                form.val('info', {
                                    "socialIns": Math.round(insurance) / 100,
                                });
                                layer.closeAll();
                            } else {
                            	layer.msg("请填写正确的数据！");
                            }
                        }
                        , btn2: function () {
                            //清空表格
                            form.val('selectCity', {
                                "city": 0,
                            });
                            form.val('ins', {
                                "pensionRate": "",
                                "medRate": "",
                                "unempRate": "",
                                "houseRate": "",
                                "pensionBase": "",
                                "medBase": "",
                                "unempBase": "",
                                "houseBase": "",
                            });
                            return false;
                        }
                    });
                }
            };


            $('#insurance').on('click', function () {
                if (form.val('info').salary != "") {
                    var othis = $(this), method = othis.data('method');
                    active[method] ? active[method].call(this, othis) : '';
                }
            });

            $('#optimazation').on('click', function () {
                var info = form.val('info');
                var pre, after;
                if (info.salary == "" || info.bonus == "" || info.socialIns == "" || info.special == "") {
                    layer.msg("请完成信息填写！");
                } else if (parseFloat(info.salary) >= 0 && parseFloat(info.bonus) >= 0 && parseFloat(info.socialIns) >= 0 && parseFloat(info.special) >= 0) {
                    var salary = parseFloat(info.salary), bonus = parseFloat(info.bonus), socialIns = parseFloat(info.socialIns), special = parseFloat(info.special);
                    //原方案计算
                    $.ajax({
                        url: "<%=basePath%>yeartax",
                        data: {
                            sumSalary: salary * 12,
                            bonus: bonus,
                            socialIns: socialIns,
                            special: special,
                            start: 5000,
                        },
                        type: "post",
                        async: false,
                        success: function (data) {
                            console.log(data);
                            pre = data;
                        }, error: function (data) {
                            alert("error");
                        }
                    });

                    //方案优化
                    $.ajax({
                        url: "<%=basePath%>optimizingForSalary",
                        data: {
                            preSalary: salary,
                            bonus: bonus,
                            socialIns: socialIns,
                            special: special,
                            start: 5000,
                        },
                        type: "post",
                        async: false,
                        success: function (data) {
                            console.log(data);
                            after = data;
                        }, error: function (data) {
                            alert("error");
                        }
                    });

                    table.render({
                        elem: '#result'
                        , cols: [[ //标题栏
                            { field: 'title', title: '',align: 'center'   }
                            , { field: 'pre', title: '原方案' ,align: 'center'  }
                            , { field: 'change', title: '调整',align: 'center'  , style: 'background:#c7e6ff; color:#000;weight:bolder;'  }
                            , { field: 'after', title: '优化方案' ,align: 'center'  }
                        ]]
                        , data: [{
                            "title": "月工资",
                            "pre": salary.toFixed(2),
                            "change": (after.after_salary / 12 - salary).toFixed(2),
                            "after": (after.after_salary / 12).toFixed(2),
                        }, {
                            "title": "年终奖",
                            "pre": bonus.toFixed(2),
                            "change": (after.after_bonus - bonus).toFixed(2),
                            "after": after.after_bonus.toFixed(2),
                        }, {
                            "title": "年纳税额",
                            "pre": (pre.tax_salary + pre.tax_bonus).toFixed(2),
                            "change": (after.after_tax - pre.tax_salary - pre.tax_bonus).toFixed(2),
                            "after": after.after_tax.toFixed(2)
                        }]
                    });

                    //图形展示
                    var dataForChart = [];
                    dataForChart.push({
                        name: "全年工资",
                        value: after.after_salary
                    });
                    dataForChart.push({
                        name: "年终奖",
                        value: after.after_bonus
                    });
                    var Chart = echarts.init(document.getElementById('echart-area'));
                    option = {
                        title: {
                            text: '最优筹划方案',
                            x: 'center'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                        },
                        series: [
                            {
                                name: '类别',
                                type: 'pie',
                                radius: '55%',
                                center: ['50%', '60%'],
                                data: dataForChart,
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };

                    Chart.setOption(option);
                   
                } else {
                	 layer.msg("请填写正确信息！");
                	 return false;
                }
               
            });
        });

        //提取城市数据
        function updatedata() {
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

        updatedata();


    </script>
</body>

</html>