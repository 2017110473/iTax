<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort() + path + "/";
%>

<!--
     汇算对比页面
     功能：对薪金所得、稿酬所得、劳动报酬、特许使用四个模块，分别进行分类计算与综合汇算，展示相关情况

     输入: 年薪所得、五险一金个人缴纳额、专项扣除、稿酬所得、劳动报酬、特许权使用所得

     输出：两种方案下的纳税情况

     辅助功能：可分月录入工资

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
  <link href="../css/comparison.css" rel="stylesheet" />
  <!-- Document Title -->
  <title>iTax | 个税对比</title>
</head>

<body>
  <!-- HEADER -->
  <header id="home">
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light ">
        <!-- Change Logo Img Here -->
        <a class="navbar-brand" href="#"><img src="../images/logo.svg" alt=""></a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <!-- Nav Link -->
              <a class="nav-link" data-scroll href="../index.jsp">主页<span class="sr-only">(current)</span></a>
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
  <!-- 标题栏 -->
  <div class="container-fluid aboutimg">
    <img src="../images/aboutimg.svg" alt="">
    <div class="container">
      <!-- Top Title -->
      <h2>汇算对比</h2>
      <!-- Top Title Info -->
      <p>年度清算与预交纳税差多少？
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
        <!--年度清单-->
        <div class="col-12 col-sm-12 col-lg-12">
          <div class="input-box">
            <!-- Title -->
            <h3>我的年度收入清单</h3>
            <!-- Replace Patch to Image Under -->
            <div class="row">
              <div class="col-12 col-sm-12 col-lg-6">
                <div class="in-box">
                  <form class="layui-form" action="" lay-filter="salary-info">
                    <div class="input-item layui-form-item">
                      <label class="input-label layui-form-label">税前年薪</label>
                      <div class="layui-input-block">
                        <input type="number" name="sumsalary" lay-verify="required" placeholder="按年填写"
                          autocomplete="off" class="layui-input">
                        <label class="yuan-label">元</label>
                      </div>
                      <label class="input-label layui-form-label" style="font-size: 10px;">每月工资不同，请尝试：</label>
                      <button data-method="salary" data-type="auto" type="button"
                        class="layui-btn layui-btn-primary layui-btn-xs" style="margin-top: 8px; margin-left:-10px;"
                        id="salary">分月记录</button>
                    </div>
                    <div class="input-item layui-form-item">
                      <label class="input-label layui-form-label">社保个人缴纳额</label>
                      <div class="layui-input-block">
                        <input type="number" name="insurance" lay-verify="required" placeholder="按年填写"
                          autocomplete="off" class="layui-input">
                        <label class="yuan-label">元</label>
                      </div>
                      <label class="input-label layui-form-label"
                        style="font-size: 10px; width: 200px;">可在支付宝或政府社保网站查询获得</label>
                    </div>
                    <div class="input-item layui-form-item">
                      <label class="input-label layui-form-label">专项扣除额</label>
                      <div class="layui-input-block">
                        <input type="number" name="special" lay-verify="required" placeholder="按年填写" autocomplete="off"
                          class="layui-input">
                        <label class="yuan-label">元</label>
                      </div>
                    </div>
                  </form>
                </div>
              </div>

              <div class="col-12 col-sm-12 col-lg-6">
                <div class="in-box">
                  <form class="layui-form" action="" lay-filter="other-info">
                    <div class="input-item layui-form-item">
                      <label class="input-label layui-form-label">劳务报酬</label>
                      <div class="layui-input-block">
                        <input type="number" name="labour" placeholder="按年填写" autocomplete="off" class="layui-input">
                        <label class="yuan-label">元</label>
                      </div>
                      <label class="input-label layui-form-label"
                        style="font-size: 10px;margin-left: 100px;">居民预扣预缴</label>
                    </div>
                    <div class="input-item layui-form-item">
                      <label class="input-label layui-form-label">稿酬所得</label>
                      <div class="layui-input-block">
                        <input type="number" name="author" placeholder="按年填写" autocomplete="off" class="layui-input">
                        <label class="yuan-label">元</label>
                      </div>
                      <label class="input-label layui-form-label"
                        style="font-size: 10px;margin-left: 100px;">居民预扣预缴</label>
                    </div>
                    <div class="input-item layui-form-item">
                      <label class="input-label layui-form-label">特许使用</label>
                      <div class="layui-input-block">
                        <input type="number" name="right" placeholder="按年填写" autocomplete="off" class="layui-input">
                        <label class="yuan-label">元</label>
                      </div>
                      <label class="input-label layui-form-label"
                        style="font-size: 10px;margin-left: 100px;">居民预扣预缴</label>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--计算按钮-->
      <div class="hero-btns input-btn">
        <a id="computing">进行计算</a>
      </div>
    </div>

    <!--计算结果-->
    <div class="container" id="show">
      <div class="row">
        <div class="col-12 col-sm-12 col-lg-3 input-txt">
          <h2 style="margin: 20px 0px;">分类计算：</h2>
        </div>
      </div>
      <div class="row">
        <div class="col-12 col-sm-12 col-lg-2">
        </div>
        <div class="col-12 col-sm-12 col-lg-8 input-chart">
          <table class="layui-table" id="classified">
            <colgroup>
              <col width="150">
              <col width="150">
              <col width="150">
              <col width="150">
              <col width="150">
              <col width="150">
            </colgroup>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col-12 col-sm-12 col-lg-3 input-txt">
          <h2 style="margin: 20px 0px;margin-top:50px">年度汇算：</h2>
        </div>
      </div>
      <div class="row">
      <div class="col-12 col-sm-12 col-lg-1">
        </div>
        <div class="col-12 col-sm-12 col-lg-10 input-chart">
          <table class="layui-table" id="comprehensive">
            <colgroup>
              <col width="100">
              <col width="100">
              <col width="100">
            </colgroup>
          </table>
        </div>
      </div>
    </div>
  </section>



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

  <!--弹出框-分月记录工资-->
  <div class="in-box" id="hidden-area">
    <div class="row">
      <div class="col-12 col-sm-12 col-lg-6">
        <div class="in-box">
          <form class="layui-form" action="" lay-filter="salary-1">
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">一月工资</label>
              <div class="layui-input-block">
                <input type="number" name="jan" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">二月工资</label>
              <div class="layui-input-block">
                <input type="number" name="feb" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">三月工资</label>
              <div class="layui-input-block">
                <input type="number" name="mar" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">四月工资</label>
              <div class="layui-input-block">
                <input type="number" name="apr" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">五月工资</label>
              <div class="layui-input-block">
                <input type="number" name="may" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">六月工资</label>
              <div class="layui-input-block">
                <input type="number" name="jun" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="col-12 col-sm-12 col-lg-6">
        <div class="in-box">
          <form class="layui-form" action="" lay-filter="salary-2">
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">七月工资</label>
              <div class="layui-input-block">
                <input type="number" name="jul" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">八月工资</label>
              <div class="layui-input-block">
                <input type="number" name="aug" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">九月工资</label>
              <div class="layui-input-block">
                <input type="number" name="sept" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">十月工资</label>
              <div class="layui-input-block">
                <input type="number" name="octo" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">十一月工资</label>
              <div class="layui-input-block">
                <input type="number" name="nov" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
            <div class="input-item layui-form-item">
              <label class="input-label layui-form-label">十二月工资</label>
              <div class="layui-input-block">
                <input type="number" name="dec" placeholder="" autocomplete="off" class="layui-input"
                  style="width: 100px; padding-left: 10px;">
                <label class="yuan-label">元</label>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
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
  <script src="../layui/layui.js" charset="utf-8"></script>
  <script src="../js/main.js"></script>
  <script src="../js/jquery.js"></script>
  <script src="../js/template.js"></script>

  <script>
    layui.use(['form', 'layer', 'table'], function () {
      var form = layui.form, layer = layui.layer, table = layui.table;
      form.render();
      $("#hidden-area").hide(); //隐藏
      $("#show").hide(); //隐藏
      table.render({
        elem: '#classified' //分类计算表格
        , cols: [[ //标题栏
          { field: 'title', title: '' }
          , { field: 'salary', title: '工资所得', align: 'center' }
          , { field: 'labour', title: '劳动所得', align: 'center' }
          , { field: 'author', title: '稿酬所得', align: 'center' }
          , { field: 'right', title: '特许使用', align: 'center' }
          , { field: 'sum', title: '合计', align: 'center' }
        ]]
        , data: [{
          "title": "税前",
          "salary": "",
          "labour": "",
          "author": "",
          "right": "",
          "sum": "",
        }, {
          "title": "纳税额",
          "salary": "",
          "labour": "",
          "author": "",
          "right": "",
          "sum": "",
        }, {
          "title": "税后",
          "salary": "",
          "labour": "",
          "author": "",
          "right": "",
          "sum": "",
        }]
      });

      table.render({
        elem: '#comprehensive' //综合汇算表格
        , cols: [[ //标题栏
          { field: 'presum', title: '税前年收入', align: 'center' }
          , { field: 'taxable', title: '应纳税所得额', align: 'center' }
          , { field: 'tax', title: '适用税率', align: 'center' }
          , { field: 'tax_value', title: '纳税额', align: 'center' }
          , { field: 'aftersum', title: '税后年收入', align: 'center' }
          , { field: 'difference', title: '两方法纳税额差额', align: 'center' }
        ]]
        , data: [{
          "presum": "",
          "taxable": "",
          "tax": "",
          "tax_value": "",
          "aftersum": "",
          "difference": "",
        }]
      });

      //触发分月计算事件
      var active = {
        salary: function (othis) {
          layer.open({
            type: 1
            , title: '分月记录工资'
            , area: '700px;'
            , shade: 0.3
            , id: 'LAY_salary' //防止重复弹出
            , content: $("#hidden-area")
            , btn: ['确定', '重置']
            , btnAlign: 'c' //按钮居中
            , yes: function () {
              var s1 = form.val('salary-1');
              var s2 = form.val('salary-2');

              //处理数据
              var sum_salary = ((s1.jan == "" || parseFloat(s1.jan) < 0) ? 0 : parseFloat(s1.jan)) + ((s1.feb == "" || parseFloat(s1.feb) < 0) ? 0 : parseFloat(s1.feb));
              sum_salary += ((s1.mar == "" || parseFloat(s1.mar) < 0) ? 0 : parseFloat(s1.mar)) + ((s1.apr == "" || parseFloat(s1.apr) < 0) ? 0 : parseFloat(s1.apr));
              sum_salary += ((s1.may == "" || parseFloat(s1.may) < 0) ? 0 : parseFloat(s1.may)) + ((s1.jun == "" || parseFloat(s1.jun) < 0) ? 0 : parseFloat(s1.jun));
              sum_salary += ((s2.jul == "" || parseFloat(s2.jul) < 0) ? 0 : parseFloat(s2.jul)) + ((s2.aug == "" || parseFloat(s2.aug) < 0) ? 0 : parseFloat(s2.aug));
              sum_salary += ((s2.sept == "" || parseFloat(s2.sept) < 0) ? 0 : parseFloat(s2.sept)) + ((s2.octo == "" || parseFloat(s2.octo) < 0) ? 0 : parseFloat(s2.octo));
              sum_salary += (s2.nov == "" || parseFloat(s2.nov) < 0) ? 0 : parseFloat(s2.nov) + ((s2.dec == "" || parseFloat(s2.dec) < 0) ? 0 : parseFloat(s2.dec));
              form.val('salary-info', {
                "sumsalary": sum_salary,
              });
              layer.closeAll();
            }, btn2: function () {
              cleanSalary();
              return false;
            }
          });
        }
      };

      //点击分月记录按钮
      $('#salary').on('click', function () {
        var othis = $(this), method = othis.data('method');
        active[method] ? active[method].call(this, othis) : '';
      });

      //清空数据
      function cleanSalary() {
        form.val('salary-1', {
          "jan": "",
          "feb": "",
          "mar": "",
          "apr": "",
          "may": "",
          "jun": "",
        }); form.val('salary-2', {
          "jul": "",
          "aug": "",
          "sept": "",
          "octo": "",
          "nov": "",
          "dec": "",
        });
      }

      //点击计算
      $('#computing').on('click', function () {
        var salary_info = form.val('salary-info');
        var other_info = form.val('other-info');
        var author, right, salary, labour, sum;
        if (salary_info.sumsalary == "" || salary_info.insurance == "" || salary_info.special == "" ||
          other_info.author == "" || other_info.right == "" || other_info.labour == "") {
          layer.msg("请完成必填信息填写！");
        } else if (parseFloat(salary_info.sumsalary) >= 0 && parseFloat(salary_info.insurance) >= 0 && parseFloat(salary_info.special) >= 0 &&
          parseFloat(other_info.author) >= 0 && parseFloat(other_info.right) >= 0 && parseFloat(other_info.labour) >= 0) {
          //计算稿酬
          if (other_info.author != "" && other_info.author != undefined) {
            $.ajax({
              url: "<%=basePath%>author",
              type: "post",
              data: {
                author: other_info.author,
              },
              async: false,
              success: function (data) {
                console.log(data);
                author = data;
              },
              error: function (data) {
                alert("error");
              }
            });
          }
          //计算特许使用纳税
          if (other_info.right != "" && other_info.right != undefined) {
            $.ajax({
              url: "<%=basePath%>right",
              type: "post",
              data: {
                right: other_info.right,
              },
              async: false,
              success: function (data) {
                console.log(data);
                right = data;
              },
              error: function (data) {
                alert("error");
              }
            });
          }
          //计算劳动报酬纳税
          if (other_info.labour != "" && other_info.labour != undefined) {
            $.ajax({
              url: "<%=basePath%>labour",
              type: "post",
              data: {
                labour: other_info.labour,
              },
              async: false,
              success: function (data) {
                console.log(data);
                labour = data;
              },
              error: function (data) {
                alert("error");
              }
            });
          }
          //计算工资
          $.ajax({
            url: "<%=basePath%>taxForSalary",
            type: "post",
            data: {
              preSalary: salary_info.sumsalary,
              socialIns: salary_info.insurance,
              special: salary_info.special,
              start: 5000 * 12,
            },
            async: false,
            success: function (data) {
              console.log(data);
              salary = data;
            },
            error: function (data) {
              alert("error");
            }
          })
          
          
          $("#show").show(); //隐藏

          table.render({
            elem: '#classified'
            , cols: [[ //标题栏
              { field: 'title', title: '' }
              , { field: 'salary', title: '工资所得', align: 'center' }
              , { field: 'labour', title: '劳动所得', align: 'center' }
              , { field: 'author', title: '稿酬所得', align: 'center' }
              , { field: 'right', title: '特许使用', align: 'center' }
              , { field: 'sum', title: '合计', align: 'center' }
            ]]
            , data: [{
              "title": "税前",
              "salary": parseFloat(salary_info.sumsalary).toFixed(2),
              "labour": parseFloat(other_info.labour).toFixed(2),
              "author": parseFloat(other_info.author).toFixed(2),
              "right": parseFloat(other_info.right).toFixed(2),
              "sum": (parseFloat(salary_info.sumsalary) + parseFloat(other_info.labour) + parseFloat(other_info.author) + parseFloat(other_info.right)).toFixed(2),
            }, {
              "title": "纳税额",
              "salary": salary.tax_value.toFixed(2),
              "labour": labour.tax_value.toFixed(2),
              "author": author.tax_value.toFixed(2),
              "right": right.tax_value.toFixed(2),
              "sum": (salary.tax_value + labour.tax_value + author.tax_value + right.tax_value).toFixed(2),
            }, {
              "title": "税后",
              "salary": salary.after_salary.toFixed(2),
              "labour": labour.after_tax.toFixed(2),
              "author": author.after_tax.toFixed(2),
              "right": right.after_tax.toFixed(2),
              "sum": (salary.after_salary + labour.after_tax + author.after_tax + right.after_tax).toFixed(2),
            }]
          });

          $.ajax({
            url: "<%=basePath%>sum",
            type: "post",
            data: {
              taxable_salary: salary.taxable_income,
              taxable_right: right.taxable_value,
              taxable_author: author.taxable_value,
              taxable_labour: labour.taxable_value,
            },
            async: false,
            success: function (data) {
              console.log(data);
              sum = data;
            },
            error: function (data) {
              alert("error");
            }
          })
          table.render({
            elem: '#comprehensive'
            , cols: [[ //标题栏
              { field: 'presum', title: '税前年收入', align: 'center' }
              , { field: 'taxable', title: '应纳税所得额', align: 'center' }
              , { field: 'tax', title: '适用税率', align: 'center' }
              , { field: 'tax_value', title: '纳税额', align: 'center' }
              , { field: 'aftersum', title: '税后年收入', align: 'center' }
              , { field: 'difference', title: '两方法纳税额差额', align: 'center', style: 'background:#c7e6ff; color:#000;weight:bolder;' }
            ]]
            , data: [{
              "presum": (parseFloat(salary_info.sumsalary) + parseFloat(other_info.labour) + parseFloat(other_info.author) + parseFloat(other_info.right)).toFixed(2),
              "taxable": sum.taxable_sum.toFixed(2),
              "tax": sum.tax.toFixed(2),
              "tax_value": sum.tax_value.toFixed(2),
              "aftersum": (parseFloat(salary_info.sumsalary) + parseFloat(other_info.labour) + parseFloat(other_info.author) + parseFloat(other_info.right) - sum.tax_value - parseFloat(salary_info.insurance)).toFixed(2),
              "difference": (sum.tax_value - salary.tax_value - labour.tax_value - author.tax_value - right.tax_value).toFixed(2),
            }]
          });
        }
        else {
        layer.msg("请完成填写正确信息！");
        return false;
        } 
      });

    });
  </script>
  <!-- Scripts Ends -->
</body>

</html>