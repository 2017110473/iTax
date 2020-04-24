<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <a class="nav-link" data-scroll href="../index.html">主页<span
                                    class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <!-- Nav Link -->
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">个税计算</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <!-- Dropdown Choice -->
                                <a class="dropdown-item" data-scroll href="../compute/gongzi.html">工资薪金 </a>
                                <a class="dropdown-item" data-scroll href="../compute/nianzhongjiang.html">年终奖 </a>
                                <a class="dropdown-item" data-scroll href="../compute/laowu.html">劳务报酬 </a>
                                <a class="dropdown-item" data-scroll href="../compute/gaochou.html">稿酬所得 </a>
                                <a class="dropdown-item" data-scroll href="../compute/texu.html">特许使用 </a>
                                <a class="dropdown-item" data-scroll href="../compute/jingying.html">经营所得 </a>
                                <a class="dropdown-item" data-scroll href="../compute/qita.html">其他所得 </a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <!-- Nav Link -->
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">个税对比</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <!-- Dropdown Choice -->
                                <a class="dropdown-item" data-scroll href="../comparison/salary.html">薪资对比 </a>
                                <a class="dropdown-item" data-scroll href="../comparison/final.html">汇算对比 </a>
                            </div>
                        </li>
                        <li class="nav-item dropdown active">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">个税优化</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <!-- Dropdown Choice -->
                                <a class="dropdown-item" data-scroll href="forsalary.html">薪资优化 </a>
                                <a class="dropdown-item" data-scroll href="forhome.html">家庭优化 </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <!-- Nav Link -->
                            <a class="nav-link" data-scroll href="#">其他</a>
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

                            <form class=" layui-form" action="" lay-filter="example">
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">我的月薪</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="identity" lay-verify="identity" placeholder=""
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                            </form>
                            <form class="layui-form" action="" lay-filter="example">
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">我的社保</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="identity" lay-verify="identity" placeholder=""
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                    <button data-method="myinsurance" data_type="auto" type="button"
                                        class="layui-btn layui-btn-primary layui-btn-xs" style="margin-left:260px"
                                        id="myinsurance">计算社会保险</button>
                                </div>
                            </form>
                            <form class="layui-form" action="" lay-filter="example">
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">配偶奖金</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="identity" lay-verify="identity" placeholder=""
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                </div>
                            </form>
                            <form class="layui-form" action="" lay-filter="example">
                                <div class="input-item layui-form-item">
                                    <label class="input-label layui-form-label">配偶社保</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="identity" lay-verify="identity" placeholder=""
                                            autocomplete="off" class="layui-input">
                                        <label class="yuan-label">元</label>
                                    </div>
                                    <button data-method="mateinsurance" data_type="auto" type="button"
                                        class="layui-btn layui-btn-primary layui-btn-xs" style="margin-left:260px"
                                        id="mateinsurance">计算社会保险</button>
                                </div>

                            </form>


                            <form class="layui-form" action="" lay-filter="example">
                                <div class="layui-form-item">
                                    <label class="input-label layui-form-label"
                                        style="margin-left: 100px; font-weight: bolder;">专项扣除</label>
                                    <div class="layui-form-item">
                                        <label class="input-label layui-form-label">家庭情况</label>
                                        <div class="layui-input-block">
                                            <input type="checkbox" lay-filter="children" name="like[children]"
                                                value="children" title="子女教育">
                                            <input type="checkbox" lay-filter="house" name="like[house]" value="house"
                                                title="住房情况">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="input-label layui-form-label">个人情况</label>
                                        <div class="layui-input-block">
                                            <input type="checkbox" lay-filter="theold" name="like[theold]"
                                                value="theold" title="赡养老人">
                                            <input type="checkbox" lay-filter="education" name="like[education]"
                                                value="education" title="继续教育">
                                        </div>
                                    </div>





                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="hero-btns input-btn">
                        <a href="#">进行优化</a>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-6">
                    <div class="block">
                        <!-- Title -->
                        <h3>节税额</h3>
                        <h4>1000元/年</h4>
                        <br />
                        <!-- Title -->
                        <h3>最优结果</h3>
                        <table class="layui-table" lay-size="lg">
                            <colgroup>
                                <col>
                                <col width="150">
                                <col width="150">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>我的扣除</th>
                                    <th>配偶扣除</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>住房扣除</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>赡养老人</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>子女教育</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>继续教育</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <!-- Title -->
                        <h3>纳税额占比</h3>
                        <!-- input Info -->
                        <div>

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

        <form class="layui-form" action="" lay-filter="example">
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label">选择城市</label>
                <div class="layui-input-block">
                    <select name="kinds" lay-filter="KindofIncome">
                        <option value="0" selected="">上海</option>
                        <option value="1">西安</option>
                    </select>
                </div>
            </div>
        </form>
        <form class=" layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label" style="font-weight:bolder;">五险一金:</label>

                <label class="layui-form-label" style="margin-left:-30px;">比例</label>
                <label class="layui-form-label" style="margin-left:-50px;">基数</label>

            </div>
        </form>



        <form class="layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">养老</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
        </form>
        <form class="layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">医疗</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
        </form>
        <form class="layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">失业</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>

            </div>
        </form>
        <form class="layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">公积金</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>

            </div>
        </form>
    </div>
    <!--弹出框:配偶社保-->
    <div class="in-box" id="hidden-area-2" style="padding: 10px;">

        <form class="layui-form" action="" lay-filter="example">
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label">选择城市</label>
                <div class="layui-input-block">
                    <select name="kinds" lay-filter="KindofIncome">
                        <option value="0" selected="">上海</option>
                        <option value="1">西安</option>
                    </select>
                </div>
            </div>
        </form>
        <form class=" layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label" style="font-weight:bolder;">五险一金:</label>

                <label class="layui-form-label" style="margin-left:-30px;">比例</label>
                <label class="layui-form-label" style="margin-left:-50px;">基数</label>

            </div>
        </form>



        <form class="layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">养老</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
        </form>
        <form class="layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">医疗</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
        </form>
        <form class="layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">失业</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>

            </div>
        </form>
        <form class="layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">公积金</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">%</label>
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 50px; padding-left: 5px; margin-left: 20px;">
                    <label class="yuan-label">元</label>
                </div>

            </div>
        </form>
    </div>
    <!--弹出框:赡养老人扣除费用-->
    <div class="in-box" id="hidden-area-3" style="padding: 10px;">

        <form class=" layui-form" action="" lay-filter="example">
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">我的扣除费用</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 100px;">
                    <label class="yuan-label">元</label>
                </div>
            </div>
            <div class="input-item layui-form-item">
                <label class="input-label layui-form-label">配偶扣除费用</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                        class="layui-input" style="width: 100px;">
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

        <form class="layui-form" action="" lay-filter="example">
            <label class="input-label layui-form-label">请选择子女个数：</label>
            <div class="select-item layui-form-item" style="width:240px; margin:auto">
                <select name="children" lay-filter="children">
                    <option value="0" selected="">0个</option>
                    <option value="1">1个</option>
                    <option value="2">2个</option>
                    <option value="3">3个</option>
                    <option value="4">4个</option>
                </select>
            </div>
            <label class="input-label layui-form-label" style="font-size: 10px; width: 200px;">注：仅含学前教育与学历教育</label>

        </form>
        </form>
    </div>

    <div class="in-box" id="hidden-area-5" style="padding: 10px; margin-left: 50px;">

        <form class="layui-form" action="" lay-filter="example">
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

    <div class="in-box" id="hidden-area-6" style="padding: 10px;  margin-left: 20px;">

        <form class="layui-form" action="" lay-filter="example">
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label" style="margin-left: 100px; font-weight: bolder;">我</label>
                <div>
                    <input type="checkbox" name="recordEducation" title="学历教育" lay-skin="primary">
                    <input type="checkbox" name="skillEducation" title="技能人员职业资格、专业技术人员职业继续教育" lay-skin="primary">
                </div>
            </div>
        </form>
        <form class="layui-form" action="" lay-filter="example">
            <div class="select-item layui-form-item">
                <label class="input-label layui-form-label" style="margin-left: 100px;font-weight: bolder; ">配偶</label>
                <div>
                    <input type="checkbox" name="recordEducation" title="学历教育" lay-skin="primary">
                    <input type="checkbox" name="skillEducation" title="技能人员职业资格、专业技术人员职业继续教育" lay-skin="primary">
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
    <!-- Scripts Ends -->
    <script>
        layui.use(['form', 'layer'], function () {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;
            form.render();
            $('#hidden-area-1').hide();
            $('#hidden-area-2').hide();
            $('#hidden-area-3').hide();
            $('#hidden-area-4').hide();
            $('#hidden-area-5').hide();
            $('#hidden-area-6').hide();
            //触发事件
            var active = {
                myinsurance: function (othis) {
                    layer.open({
                        type: 1
                        , title: '计算社会保险个人缴纳部分'
                        , area: '460px;'
                        , shade: 0.3
                        , id: 'LAY_insurance' //防止重复弹出
                        , content: $("#hidden-area-1")
                        , btn: ['确定', '修改']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            layer.closeAll();
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
                        , btn: ['确定', '修改']
                        , btnAlign: 'c' //按钮居中
                        , yes: function () {
                            layer.closeAll();
                        }
                    });
                }
            };

            $('#myinsurance').on('click', function () {
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });
            $('#mateinsurance').on('click', function () {
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });

            form.on('checkbox(theold)', function (data) {
                layer.open({
                    type: 1
                    , title: '赡养老人扣除部分'
                    , area: '350px;'
                    , shade: 0.3
                    , id: 'LAY_theold' //防止重复弹出
                    , content: $("#hidden-area-3")
                    , btn: ['确定']
                    , btnAlign: 'c' //按钮居中
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            });

            form.on('checkbox(children)', function (data) {
                layer.open({
                    type: 1
                    , title: '子女教育扣除部分'
                    , area: '300px;'
                    , shade: 0.3
                    , id: 'LAY_children' //防止重复弹出
                    , content: $("#hidden-area-4")
                    , btn: ['确定']
                    , btnAlign: 'c' //按钮居中
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            });

            form.on('checkbox(house)', function (data) {
                layer.open({
                    type: 1
                    , title: '住房情况扣除部分'
                    , area: '350px;'
                    , shade: 0.3
                    , id: 'LAY_house' //防止重复弹出
                    , content: $("#hidden-area-5")
                    , btn: ['确定']
                    , btnAlign: 'c' //按钮居中
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            });

            form.on('checkbox(education)', function (data) {
                layer.open({
                    type: 1
                    , title: '继续教育扣除部分'
                    , area: '400px;'
                    , shade: 0.3
                    , id: 'LAY_house' //防止重复弹出
                    , content: $("#hidden-area-6")
                    , btn: ['确定']
                    , btnAlign: 'c' //按钮居中
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            });

        });


    </script>



</body>

</html>