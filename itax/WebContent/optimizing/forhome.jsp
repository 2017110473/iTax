<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort() + path + "/";
%>
<!--
     家庭优化页面
     功能：针对专项扣除方面，如何分配家庭内部的总扣除额，纳税额最少

     输入: 我的月薪、我的社保缴纳额、配偶月薪、配偶缴纳额、专项情况

     输出：家庭扣除最优方案

     辅助功能：可按城市计算社保个人缴纳额；
                      可分类录入专项信息

     完成情况：董嘉懿完成
-->

<!DOCTYPE html>
<html>

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
    <!-- TOP SECTION -->
    <div class="container-fluid aboutimg">
        <img src="../images/aboutimg.svg" alt="">
        <div class="container">
            <!-- Top Title -->
            <h2>家庭优化</h2>
            <!-- Top Title Info -->
            <p>在家庭中，专项扣除如何分配？
                <br />
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
                        <h3>家庭节税</h3>
                        <!-- Replace Patch to Image Under -->
                        <div class="in-box">

                            <form class=" layui-form" action="" lay-filter="info">
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">我的月薪</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="my_salary" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">我的社保</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="my_ins" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                    <button data-method="myinsurance" data_type="auto" type="button"
                                        class="layui-btn layui-btn-primary layui-btn-xs" style="margin-left:260px"
                                        id="myinsurance">计算社会保险</button>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">配偶月薪</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="mate_salary" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">配偶社保</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="mate_ins" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                    <button data-method="mateinsurance" data_type="auto" type="button"
                                        class="layui-btn layui-btn-primary layui-btn-xs" style="margin-left:260px"
                                        id="mateinsurance">计算社会保险</button>
                                </div>
                            </form>

                            <!--专项选择(优化对象)-->
                            <form class="layui-form" action="" lay-filter="special">
                                <div class="layui-form-item">
                                    <label class="input-label layui-form-label"
                                        style="margin-left: 100px; font-weight: bolder;">专项扣除</label>
                                    <div class="layui-form-item">
                                        <label class="input-label layui-form-label">家庭情况</label>
                                        <div class="layui-input-block">
                                            <input type="checkbox" lay-filter="children" name="children"
                                                value="children" title="子女教育">
                                            <input type="checkbox" lay-filter="house" name="house" value="house"
                                                title="住房情况">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="input-label layui-form-label">个人情况</label>
                                        <div class="layui-input-block">
                                            <input type="checkbox" lay-filter="theold" name="theold" value="theold"
                                                title="赡养老人">
                                            <input type="checkbox" lay-filter="education" name="education"
                                                value="education" title="继续教育">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--优化-->
                    <div class="hero-btns input-btn">
                        <a id="optimizing">进行优化</a>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-6">
                    <div class="block">
                        <h3>最优结果</h3>
                        <!--表格-->
                        <table class="layui-table" lay-size="lg" id="result">
                            <colgroup>
                                <col>
                                <col width="150">
                                <col width="150">
                            </colgroup>
                        </table>
                        <br />
                        <!--图像展示-->
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


    <!--弹出框:我的社保-->
    <div class="in-box" id="hidden-area-1" style="padding: 10px;">
        <!-- 城市选择 -->
        <form class="layui-form" action="" lay-filter="myselectCity">
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label">选择城市</label>
                <div class="layui-input-block" id="mycitydata">
                </div>
                <script type="text/html" id="my-city-select">
					<select name="mycity"  lay-filter="mycity" lay-search="">
						<option value="0" selected="">请选择或搜索省会城市</option>
                    {{each data value i}}
                    	<option value="{{value.region}}">{{value.region}}</option>
                    {{/each}}
                    </select>
               		</script>
            </div>
        </form>

        <!-- 社会保险相关信息 -->
        <form class=" layui-form" action="" lay-filter="myins">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label" style="font-weight:bolder;">五险一金:</label>
                <label class="layui-form-label" style="margin-left:-30px;">比例</label>
                <label class="layui-form-label" style="margin-left:-50px;">基数</label>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">养老</label>
                <div class="layui-input-block">
                    <input type="number" name="myPensionRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="myPensionBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">医疗</label>
                <div class="layui-input-block">
                    <input type="number" name="myMedRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="myMedBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label ">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">失业</label>
                <div class="layui-input-block">
                    <input type="number" name="myUnempRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="myUnempBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">公积金</label>
                <div class="layui-input-block">
                    <input type="number" name="myHouseRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="myHouseBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
        </form>
    </div>

    <!--弹出框:配偶社保-->
    <div class="in-box" id="hidden-area-2" style="padding: 10px;">

        <!-- 城市选择 -->
        <form class="layui-form" action="" lay-filter="mateselectCity">
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label">选择城市</label>
                <div class="layui-input-block" id="matecitydata">
                </div>
                <script type="text/html" id="mate-city-select">
					<select name="matecity"  lay-filter="matecity" lay-search="">
						<option value="0" selected="">请选择或搜索省会城市</option>
                    {{each data value i}}
                    	<option value="{{value.region}}">{{value.region}}</option>
                    {{/each}}
                    </select>
               		</script>
            </div>
        </form>

        <!-- 社会保险相关信息 -->
        <form class=" layui-form" action="" lay-filter="mateins">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label" style="font-weight:bolder;">五险一金:</label>
                <label class="layui-form-label" style="margin-left:-30px;">比例</label>
                <label class="layui-form-label" style="margin-left:-50px;">基数</label>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">养老</label>
                <div class="layui-input-block">
                    <input type="number" name="matePensionRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="matePensionBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">医疗</label>
                <div class="layui-input-block">
                    <input type="number" name="mateMedRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="mateMedBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label ">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">失业</label>
                <div class="layui-input-block">
                    <input type="number" name="mateUnempRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="mateUnempBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">公积金</label>
                <div class="layui-input-block">
                    <input type="number" name="mateHouseRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="mateHouseBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
        </form>
    </div>

    <!--弹出框:赡养老人扣除费用-->
    <div class="in-box" id="hidden-area-3" style="padding: 10px;">

        <form class=" layui-form" action="" lay-filter="parent">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">我的扣除费用</label>
                <div class="layui-input-block">
                    <input type="number" name="myParent" placeholder="" autocomplete="off" class="layui-input"
                        style="width: 100px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">配偶扣除费用</label>
                <div class="layui-input-block">
                    <input type="number" name="mateParent" placeholder="" autocomplete="off" class="layui-input"
                        style="width: 100px;">
                    <label class="yuan-label">元</label>
                </div>
                <label class="input-label layui-form-label" style="font-size: 10px;width: 300px;">注：</label>
                <label class="input-label layui-form-label"
                    style="font-size: 10px;width: 300px;">1.独生子女不超过2000元/月</label>
                <label class="input-label layui-form-label"
                    style="font-size: 10px;width: 300px;">2.非独生子女计算：2000元/兄弟姐妹个数</label>
            </div>
        </form>
    </div>

    <!--弹出框:子女教育扣除费用-->
    <div class="in-box" id="hidden-area-4" style="padding: 10px; margin-bottom: 80px; margin-left: 20px;">

        <form class="layui-form" action="" lay-filter="kids">
            <label class="input-label layui-form-label"
                style="margin-left: 20px; font-weight: bolder; ">请选择子女个数：</label>
            <input type="number" name="numberOfKids" placeholder="" autocomplete="off" class="layui-input"
                style="width: 100px; margin-left:40px">
            <label class="yuan-label">个</label>
            <label class="input-label layui-form-label" style="font-size: 10px; width: 200px;">注：仅含学前教育与学历教育</label>
        </form>
    </div>

    <!--弹出框:住房情况扣除费用-->
    <div class="in-box" id="hidden-area-5" style="padding: 10px; margin-left: 50px;">

        <form class="layui-form" action="" lay-filter="livein">
            <label class="input-label layui-form-label"
                style="margin-left: 40px; font-weight: bolder; ">请选择住房情况：</label>
            <div>
                <input type="radio" name="home" value="loan" title="房贷利息">
                <input type="radio" name="home" value="rent1" title="在直辖市、省会、单列市租房">
                <input type="radio" name="home" value="rent2" title="在人口超过100万城市租房">
                <input type="radio" name="home" value="rent3" title="在人口少于100万城市租房">
            </div>
        </form>
    </div>

    <!--弹出框：继续教育扣除情况-->
    <div class="in-box" id="hidden-area-6" style="padding: 10px;  margin-left: 20px;">

        <form class="layui-form" action="" lay-filter="study">
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label"
                    style="margin-left: 80px; font-weight: bolder;">我的继续教育情况</label>
                <div>
                    <input type="checkbox" name="myrecordEducation" value="recordEducation" title="学历教育"
                        lay-skin="primary">
                    <input type="checkbox" name="myskillEducation" value="skillEducation" title="技能人员职业资格、专业技术人员职业继续教育"
                        lay-skin="primary">
                </div>
            </div>
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label"
                    style="margin-left: 80px;font-weight: bolder; ">配偶继续教育情况</label>
                <div>
                    <input type="checkbox" name="materecordEducation" value="recordEducation" title="学历教育"
                        lay-skin="primary">
                    <input type="checkbox" name="mateskillEducation" value="skillEducation"
                        title="技能人员职业资格、专业技术人员职业继续教育" lay-skin="primary">
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
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate
                , table = layui.table;
            form.render();
            $('#hidden-area-1').hide();//隐藏
            $('#hidden-area-2').hide();
            $('#hidden-area-3').hide();
            $('#hidden-area-4').hide();
            $('#hidden-area-5').hide();
            $('#hidden-area-6').hide();

            //表格
            table.render({
                        elem: '#result'
                        , cols: [[ //标题栏
                            { field: 'title', title: '' }
                            , { field: 'me', title: '我' }
                            , { field: 'mate', title: '配偶' }
                        ]]
                        , data: [{"title": "税前收入",
                            "me": "",
                            "mate": ""
                         },{
                            "title": "子女教育扣除",
                            "me": "",
                            "mate": "",
                        }, {
                            "title": "住房情况扣除",
                            "me": "",
                            "mate": "",
                        }, {
                            "title": "赡养老人扣除",
                            "me": "",
                            "mate": "",
                        }, {
                            "title": "继续教育扣除",
                            "me": "",
                            "mate": "",
                        }, {
                            "title": "扣除合计",
                            "me": "",
                            "mate": "",
                        }, {
                            "title": "年纳税额",
                            "me": "",
                            "mate": "",
                        }]
                    });

            //弹出框
            var active = {
                myinsurance: function (othis) {
                    layer.open({
                        type: 1
                        , title: '计算社会保险个人缴纳部分'
                        , area: '460px;'
                        , shade: 0.3
                        , id: 'LAY_insurance' //防止重复弹出
                        , content: $("#hidden-area-1")
                        , btn: ['确定', '重置']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            var myins = form.val('myins');
                            if (myins.myPensionRate == "" || myins.myPensionBase == "" || myins.myMedRate == "" || myins.myMedBase == "" ||
                                myins.myUnempRate == "" || myins.myUnempRate == "" || myins.myHouseRate == "" || myins.myHouseBase == "") {
                                if (form.val('myselectCity').mycity == "0") {
                                    layer.msg("请选择省会城市！");
                                }
                                layer.msg("请选择比例与基数！");
                            } else if (parseFloat(myins.mypensionRate) < 0 || parseFloat(myins.myPensionBase) < 0 || parseFloat(myins.myMedRate) < 0 || parseFloat(myins.myMedBase) < 0 ||
                                parseFloat(myins.myUnempRate) < 0 || parseFloat(myins.myUnempRate) < 0 || parseFloat(myins.myHouseRate) < 0 || parseFloat(myins.myHouseBase) < 0) {
                                layer.msg("请填写正确的数据！");
                            }
                            else {
                                var myinsurance = parseFloat(myins.myPensionRate) * parseFloat(myins.myPensionBase)
                                    + parseFloat(myins.myMedRate) * parseFloat(myins.myMedBase)
                                    + parseFloat(myins.myUnempRate) * parseFloat(myins.myUnempBase)
                                    + parseFloat(myins.myHouseRate) * parseFloat(myins.myHouseBase);
                                form.val('info', {
                                    "my_ins": Math.round(myinsurance) / 100,
                                });
                                layer.closeAll();
                            }
                        }
                        , btn2: function () {
                            //清空表格
                            form.val('myselectCity', {
                                "mycity": 0,
                            });
                            form.val('myins', {
                                "myPensionRate": "",
                                "myMedRate": "",
                                "myUnempRate": "",
                                "myHouseRate": "",
                                "myPensionBase": "",
                                "myMedBase": "",
                                "myUnempBase": "",
                                "myHouseBase": "",
                            });
                        }
                    });
                },
                mateinsurance: function (othis) {
                    layer.open({
                        type: 1
                        , title: '计算社会保险个人缴纳部分'
                        , area: '460px;'
                        , shade: 0.3
                        , id: 'LAY_insurance' //防止重复弹出
                        , content: $("#hidden-area-2")
                        , btn: ['确定', '重置']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            var mateins = form.val('mateins');
                            if (mateins.matePensionRate == "" || mateins.matePensionBase == "" || mateins.mateMedRate == "" || mateins.mateMedBase == "" ||
                                mateins.mateUnempRate == "" || mateins.myUnempRate == "" || mateins.mateHouseRate == "" || mateins.mateHouseBase == "") {
                                if (form.val('mateselectCity').matecity == "0") {
                                    layer.msg("请选择省会城市！");
                                }
                                layer.msg("请选择比例与基数！");
                            } else if (parseFloat(mateins.matepensionRate) < 0 || parseFloat(mateins.matePensionBase) < 0 || parseFloat(mateins.mateMedRate) < 0 || parseFloat(mateins.mateMedBase) < 0 ||
                                parseFloat(mateins.mateUnempRate) < 0 || parseFloat(mateins.mateUnempRate) < 0 || parseFloat(mateins.mateHouseRate) < 0 || parseFloat(mateins.mateHouseBase) < 0) {
                                layer.msg("请填写正确的数据！");
                            }
                            else {
                                var mateinsurance = parseFloat(mateins.matePensionRate) * parseFloat(mateins.matePensionBase)
                                    + parseFloat(mateins.mateMedRate) * parseFloat(mateins.mateMedBase)
                                    + parseFloat(mateins.mateUnempRate) * parseFloat(mateins.mateUnempBase)
                                    + parseFloat(mateins.mateHouseRate) * parseFloat(mateins.mateHouseBase);
                                form.val('info', {
                                    "mate_ins": Math.round(mateinsurance) / 100,
                                });
                                layer.closeAll();
                            }
                        }
                        , btn2: function () {
                            //清空表格
                            form.val('mateselectCity', {
                                "matecity": 0,
                            });
                            form.val('mateins', {
                                "matePensionRate": "",
                                "mateMedRate": "",
                                "mateUnempRate": "",
                                "mateHouseRate": "",
                                "matePensionBase": "",
                                "mateMedBase": "",
                                "mateUnempBase": "",
                                "mateHouseBase": "",
                            });
                        }
                    });
                }
            };

            $('#myinsurance').on('click', function () {
                if (form.val('info').my_salary == "") {
                    layer.msg("请填写您的税前月薪");
                    return false;
                }
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });

            $('#mateinsurance').on('click', function () {
                if (form.val('info').mate_salary == "") {
                    layer.msg("请填写配偶的税前月薪");
                    return false;
                }
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });

            //赡养老人弹出框
            form.on('checkbox(theold)', function (data) {
                if (form.val('special').theold == "theold") {
                    layer.open({
                        type: 1
                        , title: '赡养老人扣除部分'
                        , area: '350px;'
                        , closeBtn: false
                        , shade: 0.3
                        , id: 'LAY_theold' //防止重复弹出
                        , content: $("#hidden-area-3")
                        , btn: ['确定']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            if (parseFloat(form.val('parent').myParent) < 0 || parseFloat(form.val('parent').mateParent) < 0) {
                                form.val('special', {
                                    "theold": "",
                                });
                                layer.closeAll();
                            } else if (form.val('parent').myParent == "" && form.val('parent').mateParent == "") {
                                form.val('special', {
                                    "theold": "",
                                });
                                layer.closeAll();
                            } else {
                                layer.closeAll();
                            }
                        }
                    });
                } else {
                    form.val('parent', {
                        "myParent": "",
                        "mateParent": "",
                    })
                }
            });

            //子女教育弹出框
            form.on('checkbox(children)', function (data) {
                if (form.val('special').children == "children") {
                    layer.open({
                        type: 1
                        , title: '子女教育扣除部分'
                        , area: '260px;'
                        , closeBtn: false
                        , shade: 0.3
                        , id: 'LAY_children' //防止重复弹出
                        , content: $("#hidden-area-4")
                        , btn: ['确定']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            if (form.val('kids').numberOfKids < 1) {
                                form.val('special', {
                                    "children": "",
                                })
                                layer.closeAll();
                            } else if (form.val('kids').numberOfKids == "") {
                                form.val('special', {
                                    "children": "",
                                })
                                layer.closeAll();
                            } else {
                                layer.closeAll();
                            }
                        }
                    });
                } else {
                    form.val('kids', {
                        "numberOfKids": "",
                    })
                }
            });

            //住房情况弹出框
            form.on('checkbox(house)', function (data) {
                if (form.val('special').house == "house") {
                    layer.open({
                        type: 1
                        , title: '住房情况扣除部分'
                        , closeBtn: false
                        , area: '350px;'
                        , shade: 0.3
                        , id: 'LAY_house' //防止重复弹出
                        , content: $("#hidden-area-5")
                        , btn: ['确定']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            if (form.val('livein').home == undefined || form.val('livein').home == "") {
                                form.val('special', {
                                    "house": "",
                                })
                            }
                            layer.closeAll();
                        }
                    });
                }
            });

            //继续教育弹出框
            form.on('checkbox(education)', function (data) {
                if (form.val('special').education == "education") {
                    layer.open({
                        type: 1
                        , title: '继续教育扣除部分'
                        , area: '400px;'
                        , closeBtn: false
                        , shade: 0.3
                        , id: 'LAY_house' //防止重复弹出
                        , content: $("#hidden-area-6")
                        , btn: ['确定']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            if (form.val('study').myrecordEducation == "" && form.val('study').myskillEducation == "" &&
                                form.val('study').mateskillEducation == "" && form.val('study').materecordEducation == "") {
                                form.val('special', {
                                    "education": "",
                                })
                            }
                            layer.closeAll();
                        }
                    });
                } else {
                    form.val('study', {
                        "myrecordEducation": "",
                        "myskillEducation": "",
                        "materecordEducation": "",
                        "mateskillEducation": "",
                    })
                }
            });

            //显示我的社保
            form.on('select(mycity)', function (data) {
                var region = data.value;
                $.ajax({
                    url: "<%=basePath%>selectByRegion",
                    data: {
                        region: region,
                    },
                    type: "post",
                    async: false,
                    success: function (data) {
                        var mysalary = parseFloat(form.val('info').my_salary);
                        var myPensionRate = data.pension.substring(0, data.pension.length - 1);
                        var myPensionBase;
                        var myMedRate = data.med.substring(0, data.med.length - 1);
                        var myMedBase;
                        var myUnempRate = data.unemp.substring(0, data.unemp.length - 1);
                        var myUnempBase;
                        var myHouseRate = data.house.substring(0, data.house.length - 1);
                        var myHouseBase;

                        //养老基数
                        if (mysalary < parseFloat(data.lpension)) myPensionBase = parseFloat(data.lpension);
                        else if (mysalary > parseFloat(data.upension)) myPensionBase = parseFloat(data.upension);
                        else myPensionBase = mysalary;
                        //医疗基数
                        if (mysalary < parseFloat(data.lmed)) myMedBase = parseFloat(data.lmed);
                        else if (mysalary > parseFloat(data.umed)) myMedBase = parseFloat(data.umed);
                        else myMedBase = mysalary;
                        //失业基数
                        if (mysalary < parseFloat(data.lunemp)) myUnempBase = parseFloat(data.lunemp);
                        else if (mysalary > parseFloat(data.uunemp)) myUnempBase = parseFloat(data.uunemp);
                        else myUnempBase = mysalary;
                        //公积金基数
                        if (mysalary < parseFloat(data.lhouse)) myHouseBase = parseFloat(data.lhouse);
                        else if (mysalary > parseFloat(data.uhouse)) myHouseBase = parseFloat(data.uhouse);
                        else myHouseBase = mysalary;

                        form.val('myins', {
                            "myPensionRate": myPensionRate,
                            "myMedRate": myMedRate,
                            "myUnempRate": myUnempRate,
                            "myHouseRate": myHouseRate,
                            "myPensionBase": myPensionBase,
                            "myMedBase": myMedBase,
                            "myUnempBase": myUnempBase,
                            "myHouseBase": myHouseBase,
                        });
                    },
                    error: function (data) {
                        alert("error");
                    }
                })
            });

            //显示配偶的社保
            form.on('select(matecity)', function (data) {
                var region = data.value;
                $.ajax({
                    url: "<%=basePath%>selectByRegion",
                    data: {
                        region: region,
                    },
                    type: "post",
                    async: false,
                    success: function (data) {

                        var matesalary = parseFloat(form.val('info').mate_salary);
                        var matePensionRate = data.pension.substring(0, data.pension.length - 1);
                        var matePensionBase;
                        var mateMedRate = data.med.substring(0, data.med.length - 1);
                        var mateMedBase;
                        var mateUnempRate = data.unemp.substring(0, data.unemp.length - 1);
                        var mateUnempBase;
                        var mateHouseRate = data.house.substring(0, data.house.length - 1);
                        var mateHouseBase;

                        //养老基数
                        if (matesalary < parseFloat(data.lpension)) matePensionBase = parseFloat(data.lpension);
                        else if (matesalary > parseFloat(data.upension)) matePensionBase = parseFloat(data.upension);
                        else matePensionBase = matesalary;
                        //医疗基数
                        if (matesalary < parseFloat(data.lmed)) mateMedBase = parseFloat(data.lmed);
                        else if (matesalary > parseFloat(data.umed)) mateMedBase = parseFloat(data.umed);
                        else mateMedBase = matesalary;
                        //失业基数
                        if (matesalary < parseFloat(data.lunemp)) mateUnempBase = parseFloat(data.lunemp);
                        else if (matesalary > parseFloat(data.uunemp)) mateUnempBase = parseFloat(data.uunemp);
                        else mateUnempBase = matesalary;
                        //公积金基数
                        if (matesalary < parseFloat(data.lhouse)) mateHouseBase = parseFloat(data.lhouse);
                        else if (matesalary > parseFloat(data.uhouse)) mateHouseBase = parseFloat(data.uhouse);
                        else mateHouseBase = matesalary;

                        form.val('mateins', {
                            "matePensionRate": matePensionRate,
                            "mateMedRate": mateMedRate,
                            "mateUnempRate": mateUnempRate,
                            "mateHouseRate": mateHouseRate,
                            "matePensionBase": matePensionBase,
                            "mateMedBase": mateMedBase,
                            "mateUnempBase": mateUnempBase,
                            "mateHouseBase": mateHouseBase,
                        });
                    },
                    error: function (data) {
                        alert("error");
                    }
                })
            });

            $('#optimizing').on('click', function () {
                var info = form.val('info');
                var data=[], mydata=[], matedata=[];
                if (info.my_salary == "" || info.my_ins == "" || info.mate_ins == "" || info.mate_salary == "") {
                    layer.msg("请完成基础信息填写！");
                    return false;
                } if (parseFloat(info.my_salary) < 0 || parseFloat(info.my_ins) < 0 || parseFloat(info.mate_ins) < 0 || parseFloat(info.mate_salary) < 0) {
                    layer.msg("请填写正确数据！");
                    return false;
                } else {
                    $.ajax({
                        url: "<%=basePath%>optimizingForHome",
                        type: "post",
                        data: {
                            my_salary: info.my_salary,
                            my_ins: info.my_ins,
                            mate_salary: info.mate_salary,
                            mate_ins: info.mate_ins,
                            my_parent: form.val('parent').myParent,
                            mate_parent: form.val('parent').mateParent,
                            number_kids: form.val('kids').numberOfKids,
                            homeselect: form.val('special').house,
                            home: form.val('livein').home,
                            myrecordEducation: form.val('study').myrecordEducation,
                            myskillEducation: form.val('study').myskillEducation,
                            materecordEducation: form.val('study').materecordEducation,
                            mateskillEducation: form.val('study').mateskillEducation,
                        },
                        async: false,
                        success: function (data) {
                            console.log(data);
                            
                            var param_kid = -1, param_home = -1;
                            if (data.who_for_kids == "mate") {
                                param_kid = 0;
                            } else if (data.who_for_kids == "m") {
                                param_kid = 1;
                            } else if (data.who_for_kids == "mandmate") {
                                param_kid = 0.5;
                            }
                            if (data.who_for_home == "mate") {
                                param_home = 0;
                            } else if (data.who_for_home == "m") {
                                param_home = 1;
                            } else if (data.who_for_home == "mandmate") {
                                param_home = 0.5;
                            }

                            var mesum = (param_kid == -1) ? 0 : param_kid * data.for_kids;
                            mesum += (param_home == -1) ? 0 : param_home * data.for_home;
                            mesum += data.my_parent + data.myskillEducation + data.myrecordEducation;
                            var matesum = (param_kid == -1) ? 0 : (1 - param_kid) * data.for_kids;
                            matesum += (param_home == -1) ? 0 : (1 - param_home) * data.for_home;
                            matesum += data.mate_parent + data.mateskillEducation + data.materecordEducation;
                            
                            //从应纳税所得额计算纳税额
                            $.ajax({
                                url: "<%=basePath%>sum",
                                type: "post",
                                data: {
                                    taxable_salary: info.my_salary*12 - info.my_ins*12 - mesum - 5000*12,
                                    taxable_author: 0,
                                    taxable_right:0,
                                    taxable_labour:0,
                                },
                                async: false,
                                success: function (data) {
                                    console.log(data);
                                    mydata = data;
                                },
                                error: function (data) {
                                    alert("error");
                                }
                            });
                            
                          //从应纳税所得额计算纳税额
                            $.ajax({
                                url: "<%=basePath%>sum",
                                type: "post",
                                data: {
                                    taxable_salary: info.mate_salary*12 - info.mate_ins*12 - matesum - 5000*12,
                                    taxable_author: 0,
                                    taxable_right:0,
                                    taxable_labour:0,
                                },
                                async: false,
                                success: function (data) {
                                    console.log(data);
                                    matedata = data;
                                },
                                error: function (data) {
                                    alert("error");
                                }
                            });
                          
                            
                            table.render({
                                elem: '#result'
                                , cols: [[ //标题栏
                                    { field: 'title', title: '' }
                                    , { field: 'me', title: '我' }
                                    , { field: 'mate', title: '配偶' }
                                ]]
                                , data: [{
                                    "title": "税前收入",
                                    "me": (info.my_salary * 12).toFixed(2),
                                    "mate": (info.mate_salary * 12).toFixed(2),
                                }, {
                                    "title": "子女教育扣除",
                                    "me": (param_kid == -1 ? 0 : param_kid * data.for_kids).toFixed(2),
                                    "mate": (param_kid == -1 ? 0 : (1 - param_kid) * data.for_kids).toFixed(2),
                                }, {
                                    "title": "住房情况扣除",
                                    "me": (param_home == -1 ? 0 : param_home * data.for_home).toFixed(2),
                                    "mate": (param_home == -1 ? 0 : (1 - param_home) * data.for_home).toFixed(2),
                                }, {
                                    "title": "赡养老人扣除",
                                    "me": data.my_parent.toFixed(2),
                                    "mate": data.mate_parent.toFixed(2),
                                }, {
                                    "title": "继续教育扣除",
                                    "me": (data.myskillEducation + data.myrecordEducation).toFixed(2),
                                    "mate": (data.mateskillEducation + data.materecordEducation).toFixed(2),
                                }, {
                                    "title": "扣除合计",
                                    "me": mesum.toFixed(2),
                                    "mate": matesum.toFixed(2),
                                }, {
                                    "title": "年纳税额",
                                    "me": mydata.tax_value.toFixed(2),
                                    "mate": matedata.tax_value.toFixed(2),
                                }]
                            });

                            
                            var dataForChart = [];
                            dataForChart.push({
                                name: "我",
                                value: mesum.toFixed(2)
                            });
                            dataForChart.push({
                                name: "配偶",
                                value: matesum.toFixed(2)
                            });
                            var Chart = echarts.init(document.getElementById('echart-area'));
                            option = {
                                title: {
                                    text: '扣除分配比例',
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
                                        name: '扣除',
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
                        },
                        error: function (data) {
                            alert("error");
                        }
                    });            
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
                    $("#mycitydata").append(template("my-city-select", { data: data }));
                    $("#matecitydata").append(template("mate-city-select", { data: data }));
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