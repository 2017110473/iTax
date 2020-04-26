<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<head>
    <!-- Metas -->
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <!-- Links -->
    <link rel="shortcut icon" type="image/png" href="../images/favicon.png" />
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,600&display=swap" rel="stylesheet">
    <link href="../css/icofont.min.css" rel="stylesheet">

    <link href="../layui/css/layui-1.css" rel="stylesheet" media="all">
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/slick.css" rel="stylesheet" />

    <link href="../css/main.css" rel="stylesheet" />
    <link href="../css/comparison.css" rel="stylesheet" />
    <!-- Document Title -->
    <title>iTax | 个税对比</title>
</head>

<body>
    <!-- 导航栏 -->
    <header id="home">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light ">
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
                        <li class="nav-item dropdown active">
                            <!-- Nav Link -->
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">个税对比</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <!-- Dropdown Choice -->
                                <a class="dropdown-item" data-scroll href="salary.jsp">薪资对比 </a>
                                <a class="dropdown-item" data-scroll href="final.jsp">汇算对比 </a>
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

    <!-- 标题 -->
    <div class="container-fluid aboutimg">
        <img src="../images/aboutimg.svg" alt="">
        <div class="container">
            <!-- Top Title -->
            <h2>薪资对比</h2>
            <!-- Top Title Info -->
            <p>多种薪资方案怎么选？
                <br />
                <br />
            </p>
        </div>
    </div>


    <!-- INPUTS SECTION -->
    <section id="input" class="inputs">
        <!--背景图片-->
        <div class="side-img">
            <img src="../images/aside3.svg" alt="">
        </div>
        <div class="container">
            <div class="row">
                <!-- 方案一部分 -->
                <div class="col-12 col-sm-6 col-lg-6">
                    <div class="input-box">
                        <h3>方案一</h3>
                        <div class="in-box">
                            <form class=" layui-form" action="" lay-filter="strategy1">
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">税前月薪</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="salary1" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">年终奖金</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="bonus1" lay-verify="required" placeholder="按年填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">社会保险</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="insurance1" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                    <button data-method="insurance1" data-type="auto" type="button"
                                        class="layui-btn layui-btn-primary layui-btn-xs" style="margin-left:260px"
                                        id="insurance1">计算社会保险</button>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">专项扣除</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="special1" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- 方案二模块 -->
                <div class="col-12 col-sm-6 col-lg-6">
                    <div class="input-box">
                        <h3>方案二</h3>
                        <div class="in-box">
                            <form class="layui-form" action="" lay-filter="strategy2">
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">税前月薪</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="salary2" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">年终奖金</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="bonus2" lay-verify="required" placeholder="按年填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">社会保险</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="insurance2" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                    <button data-method="insurance2" data-type="auto" type="button"
                                        class="layui-btn layui-btn-primary layui-btn-xs" style="margin-left:260px"
                                        id="insurance2">计算社会保险</button>
                                </div>
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">专项扣除</label>
                                    <div class="layui-input-block">
                                        <input type="number" name="special2" lay-verify="required" placeholder="按月填写"
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--对比按钮-->
            <div class="hero-btns input-btn">
                <a id="computing">进行对比</a>
            </div>
        </div>

        <!--对比结果-->
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-12 col-lg-3 input-txt">
                    <h2>对比结果：</h2>
                </div>
                <div class="col-12 col-sm-12 col-lg-9 input-chart">
                    <table class="layui-table" lay-size="lg" id="result">
                        <colgroup>
                            <col>
                            <col width="200">
                            <col width="200">
                        </colgroup>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <!--footer-->
    <footer style="margin-top:50px">
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

    <!--弹出框1-方案一社保计算-->
    <div class="in-box" id="hidden-area-1" style="padding: 10px;">
        <!-- 城市选择 -->
        <form class="layui-form" action="" lay-filter="selectCity1">
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label">选择城市</label>
                <div class="layui-input-block" id="citydata1">
                </div>
                <script type="text/html" id="city-select1">
					<select name="city1"  lay-filter="city1" lay-search="">
						<option value="0" selected="">请选择或搜索省会城市</option>
                    {{each data value i}}
                    	<option value="{{value.region}}">{{value.region}}</option>
                    {{/each}}
                    </select>
               		</script>
            </div>
        </form>

        <!-- 社会保险相关信息 -->
        <form class=" layui-form" action="" lay-filter="ins1">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label" style="font-weight:bolder;">五险一金:</label>
                <label class="layui-form-label" style="margin-left:-30px;">比例</label>
                <label class="layui-form-label" style="margin-left:-50px;">基数</label>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">养老</label>
                <div class="layui-input-block">
                    <input type="number" name="pensionRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="pensionBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">医疗</label>
                <div class="layui-input-block">
                    <input type="number" name="medRate" placeholder="" autocomplete="off" class="layui-input changeable"
                        style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="medBase" placeholder="" autocomplete="off" class="layui-input changeable"
                        style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label ">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">失业</label>
                <div class="layui-input-block">
                    <input type="number" name="unempRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="unempBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">公积金</label>
                <div class="layui-input-block">
                    <input type="number" name="houseRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="houseBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
        </form>
    </div>

    <!--弹出框2-方案二社保计算-->
    <div class="in-box" id="hidden-area-2" style="padding: 10px;">
        <!-- 城市选择 -->
        <form class="layui-form" action="" lay-filter="selectCity2">
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label">选择城市</label>
                <div class="layui-input-block" id="citydata2">
                </div>
                <script type="text/html" id="city-select2">
					<select name="city2"  lay-filter="city2" lay-search="">
						<option value="0" selected="">请选择或搜索省会城市</option>
                    {{each data value i}}
                    	<option value="{{value.region}}">{{value.region}}</option>
                    {{/each}}
                    </select>
               		</script>
            </div>
        </form>

        <!-- 社会保险相关信息 -->
        <form class=" layui-form" action="" lay-filter="ins2">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label" style="font-weight:bolder;">五险一金:</label>
                <label class="layui-form-label" style="margin-left:-30px;">比例</label>
                <label class="layui-form-label" style="margin-left:-50px;">基数</label>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">养老</label>
                <div class="layui-input-block">
                    <input type="number" name="pensionRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="pensionBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">医疗</label>
                <div class="layui-input-block">
                    <input type="number" name="medRate" placeholder="" autocomplete="off" class="layui-input changeable"
                        style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="numbe" name="medBase" placeholder="" autocomplete="off" class="layui-input changeable"
                        style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label ">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">失业</label>
                <div class="layui-input-block">
                    <input type="number" name="unempRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="unempBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">公积金</label>
                <div class="layui-input-block">
                    <input type="number" name="houseRate" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="number" name="houseBase" placeholder="" autocomplete="off"
                        class="layui-input changeable" style="width: 80px; padding-left: 5px; margin-left: 20px;">
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
    <script src="../layui/layui.js" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/slick.min.js"></script>
    <script src="../js/smooth-scroll.min.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/jquery.js"></script>
    <script src="../js/template.js"></script>
    <script>
        layui.use(['form', 'layer', 'table'], function () {
            var form = layui.form,
                table = layui.table,
                layer = layui.layer;
            form.render(); //表单渲染
            $('#hidden-area-1').hide(); //隐藏弹出框
            $('#hidden-area-2').hide();

            //渲染表格
            table.render({
                elem: '#result'
                , cols: [[ //标题栏
                    { field: 'title', title: '名称' }
                    , { field: 'stg1', title: '方案一' }
                    , { field: 'stg2', title: '方案二' }
                    , { field: 'best', title: '优选方案' }
                ]]
                , data: [{
                    "title": "税前年薪",
                    "stg1": "",
                    "stg2": "",
                    "best": "",
                }, {
                    "title": "税后年薪",
                    "stg1": "",
                    "stg2": "",
                    "best": "",
                }, {
                    "title": "纳税总额",
                    "stg1": "",
                    "stg2": "",
                    "best": "",
                }, {
                    "title": "社保个人缴纳额",
                    "stg1": "",
                    "stg2": "",
                    "best": "",
                }]
            });

            //选择城市读取社保信息
            form.on('select(city1)', function (data) {
                var region = data.value;
                $.ajax({
                    url: "<%=basePath%>selectByRegion",
                    data: {
                        region: region,
                    },
                    type: "post",
                    async: false,
                    success: function (data) {

                        var salary = parseFloat(form.val('strategy1').salary1);

                        var pensionRate = data.pension.substring(0, data.pension.length - 1);
                        var pensionBase;
                        var medRate = data.med.substring(0, data.med.length - 1);
                        var medBase;
                        var unempRate = data.unemp.substring(0, data.unemp.length - 1);
                        var unempBase;
                        var houseRate = data.house.substring(0, data.house.length - 1);
                        var houseBase;
                        //判断工资是否在基数范围内
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

                        form.val('ins1', {
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

            form.on('select(city2)', function (data) {
                var region = data.value;
                $.ajax({
                    url: "<%=basePath%>selectByRegion",
                    data: {
                        region: region,
                    },
                    type: "post",
                    async: false,
                    success: function (data) {

                        var salary = parseFloat(form.val('strategy2').salary2);

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

                        form.val('ins2', {
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

            //触发弹出框事件
            var active = {
                insurance1: function (othis) {
                    layer.open({
                        type: 1
                        , title: '计算社会保险个人缴纳部分'
                        , area: '460px;'
                        , shade: 0.3
                        , id: 'LAY_insurance' //防止重复弹出
                        , content: $("#hidden-area-1")
                        , btn: ['确定']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            var ins = form.val('ins1');
                            //确保数据完整性
                            if (ins.pensionRate == "" || ins.pensionBase == "" || ins.medRate == "" || ins.medBase == "" ||
                                ins.unempRate == "" || ins.unempRate == "" || ins.houseRate == "" || ins.houseBase == "") {
                                if (form.val('selectCity1').city1 == "0") {
                                    layer.msg("请选择省会城市！");
                                }
                                layer.msg("请选择比例与基数！");
                                //确保不存在负值
                            } else if (parseFloat(ins.pensionRate) < 0 || parseFloat(ins.pensionBase) < 0 || parseFloat(ins.medRate) < 0 || parseFloat(ins.medBase) < 0 ||
                                parseFloat(ins.unempRate) < 0 || parseFloat(ins.unempRate) < 0 || parseFloat(ins.houseRate) < 0 || parseFloat(ins.houseBase) < 0) {
                                layer.msg("请填写正确的数据！");
                            }
                            else { //进行计算
                                var insurance = parseFloat(ins.pensionRate) * parseFloat(ins.pensionBase)
                                    + parseFloat(ins.medRate) * parseFloat(ins.medBase)
                                    + parseFloat(ins.unempRate) * parseFloat(ins.unempBase)
                                    + parseFloat(ins.houseRate) * parseFloat(ins.houseBase);
                                form.val('strategy1', {
                                    "insurance1": Math.round(insurance) / 100,
                                });
                                layer.closeAll();
                            }
                        }
                        ,btn2:function() {
                        	//清空表格
                            form.val('selectCity1', {
                                "city1": 0,
                            });
                            form.val('ins1', {
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
                }, insurance2: function (othis) {
                    layer.open({
                        type: 1
                        , title: '计算社会保险个人缴纳部分'
                        , area: '460px;'
                        , shade: 0.3
                        , id: 'LAY_insurance-2' //防止重复弹出
                        , content: $("#hidden-area-2")
                        , btn: ['确定', '重置']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            var ins = form.val('ins2');
                            if (ins.pensionRate == "" || ins.pensionBase == "" || ins.medRate == "" || ins.medBase == "" ||
                                ins.unempRate == "" || ins.unempRate == "" || ins.houseRate == "" || ins.houseBase == "") {
                                if (form.val('selectCity2').city2 == "0") {
                                    layer.msg("请选择省会城市！");
                                }
                                layer.msg("请选择比例与基数！");
                            } else if (parseFloat(ins.pensionRate) < 0 || parseFloat(ins.pensionBase) < 0 || parseFloat(ins.medRate) < 0 || parseFloat(ins.medBase) < 0 ||
                                parseFloat(ins.unempRate) < 0 || parseFloat(ins.unempRate) < 0 || parseFloat(ins.houseRate) < 0 || parseFloat(ins.houseBase) < 0) {
                                layer.msg("请填写正确的数据！");
                            } else {
                                var insurance = parseFloat(ins.pensionRate) * parseFloat(ins.pensionBase)
                                    + parseFloat(ins.medRate) * parseFloat(ins.medBase)
                                    + parseFloat(ins.unempRate) * parseFloat(ins.unempBase)
                                    + parseFloat(ins.houseRate) * parseFloat(ins.houseBase);
                                form.val('strategy2', {
                                    "insurance2": Math.round(insurance) / 100,
                                });
                                layer.closeAll();
                            }
                        }
                        ,btn2:function(){
                        	//清空表格
                            form.val('selectCity2', {
                                "city2": 0,
                            });
                            form.val('ins2', {
                                "pensionRate": "",
                                "medRate": "",
                                "unempRate": "",
                                "houseRate": "",
                                "pensionBase": "",
                                "medBase": "",
                                "unempBase": "",
                                "houseBase": "",
                            });
                        }    
                    });
                }
            };

            //弹出弹出框
            $('#insurance1').on('click', function () {
                

                if (form.val('strategy1').salary1 != "") {
                    var othis = $(this), method = othis.data('method');
                    active[method] ? active[method].call(this, othis) : '';
                } else {
                    layer.msg("请选择填写月薪信息！");
                }
            });

            $('#insurance2').on('click', function () {
                if (form.val('strategy2').salary2 != "") {
                    var othis = $(this), method = othis.data('method');
                    active[method] ? active[method].call(this, othis) : '';
                } else {
                    layer.msg("请选择填写月薪信息！");
                }
            });


            //点击计算事件
            $('#computing').on('click', function () {
                var stg1 = form.val('strategy1');
                var stg2 = form.val('strategy2');
                if (stg1.salary1 == "" || stg1.bonus1 == "" || stg1.insurance1 == "" || stg1.special1 == "" ||
                    stg2.salary2 == "" || stg2.bonus2 == "" || stg2.insurance2 == "" || stg2.special2 == "") {
                    layer.msg("请完成必填信息填写！");//确保数据完整性
                } else if (parseFloat(stg1.salary1) < 0 || parseFloat(stg1.bonus1) < 0 || parseFloat(stg1.insurance1) < 0 || parseFloat(stg1.special1) < 0 ||
                    parseFloat(stg2.salary2) < 0 || parseFloat(stg2.bonus2) < 0 || parseFloat(stg2.insurance2) < 0 || parseFloat(stg2.special2) < 0) {
                    layer.msg("请填写正确数据！");//确保数据正确不为负值
                }
                else {
                    //进行计算
                    $.ajax({
                        url: "<%=basePath%>yeartax",
                        type: "post",
                        data: {
                            sumSalary: stg1.salary1 * 12,
                            bonus: stg1.bonus1,
                            socialIns: stg1.insurance1,
                            special: stg1.special1,
                            start: 5000,
                        },
                        async: false,
                        success: function (data) {
                            console.log(data);
                            stg1 = data;
                        },
                        error: function (data) {
                            alert("error");
                        }
                    });
                    $.ajax({
                        url: "<%=basePath%>yeartax",
                        type: "post",
                        data: {
                            sumSalary: stg2.salary2 * 12,
                            bonus: stg2.bonus2,
                            socialIns: stg2.insurance2,
                            special: stg2.special2,
                            start: 5000,
                        },
                        async: false,
                        success: function (data) {
                            console.log(data);
                            stg2 = data;
                        },
                        error: function (data) {
                            alert("error");
                        }
                    });

                    var tax1 = stg1.tax_salary + stg1.tax_bonus,tax2 = stg2.tax_salary + stg2.tax_bonus;
                    
                    //数据展示
                    table.render({
                        elem: '#result'
                        , cols: [[ //标题栏
                            { field: 'title', title: '名称' }
                            , { field: 'stg1', title: '方案一' }
                            , { field: 'stg2', title: '方案二' }
                            , { field: 'best', title: '优选方案' }
                        ]]
                        , data: [{
                            "title": "税前年薪",
                            "stg1": Math.round(stg1.pretax_income * 100) / 100, //控制数据为两位小数，下同
                            "stg2": Math.round(stg2.pretax_income * 100) / 100,
                            "best": stg1.pretax_income > stg2.pretax_income ? "方案一" : "方案二",
                        }, {
                            "title": "税后年薪",
                            "stg1": Math.round(stg1.aftertax_income * 100) / 100,
                            "stg2": Math.round(stg2.aftertax_income * 100) / 100,
                            "best": stg1.aftertax_income > stg2.aftertax_income ? "方案一" : "方案二",
                        }, {
                            "title": "纳税总额",
                            "stg1": Math.round(stg1.tax_salary *100+ stg1.tax_bonus * 100) / 100,
                            "stg2": Math.round(stg2.tax_salary*100 + stg2.tax_bonus * 100) / 100,
                            "best": tax1 > tax2 ? "方案二" : "方案一",
                        }, {
                            "title": "社保个人缴纳总额",
                            "stg1": Math.round(parseFloat(form.val('strategy1').insurance1) * 12 * 100) / 100,
                            "stg2": Math.round(parseFloat(form.val('strategy2').insurance2) * 12 * 100) / 100,
                            "best": form.val('strategy1').insurance1 > form.val('strategy2').insurance2 ? "方案一" : "方案二",
                        }]
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
                    $("#citydata1").append(template("city-select1", { data: data }));
                    $("#citydata2").append(template("city-select2", { data: data }));
                },
                error: function (data) {
                    alert("error");
                }
            });
        }

        updatedata();
    </script>
    <!-- Scripts Ends -->
</body>
</html>