<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  <!-- Metas -->
  <meta charset="UTF-8">
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="" />
  <!-- Links -->
  <link rel="shortcut icon" type="image/png" href="images/favicon.png" />
  <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,600&display=swap" rel="stylesheet">
  <link href="css/icofont.min.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/slick.css" rel="stylesheet" />

  <link href="css/main.css" rel="stylesheet" />
  <!-- Document Title -->
  <title>iTax | 个税小帮手</title>
</head>

<body>
  <!-- HEADER SECTION -->
  <header id="home">
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light ">
        <!-- Change Logo Img Here -->
        <a class="navbar-brand" href="#"><img src="images/logo.svg" alt=""></a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <!-- Nav Link -->
              <a class="nav-link" data-scroll href="#home">主页<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
              <!-- Nav Link -->
              <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">个税计算</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <!-- Dropdown Choice -->
                <a class="dropdown-item" data-scroll href="compute/gongzi.jsp">工资薪金 </a>
                <a class="dropdown-item" data-scroll href="compute/nianzhongjiang.jsp">年终奖 </a>
                <a class="dropdown-item" data-scroll href="compute/laowu.jsp">劳务报酬 </a>
                <a class="dropdown-item" data-scroll href="compute/gaochou.jsp">稿酬所得 </a>
                <a class="dropdown-item" data-scroll href="compute/texu.jsp">特许使用 </a>
                <a class="dropdown-item" data-scroll href="compute/jingying.jsp">经营所得 </a>
                <a class="dropdown-item" data-scroll href="compute/qita.jsp">其他所得 </a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <!-- Nav Link -->
              <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">个税对比</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <!-- Dropdown Choice -->
                <a class="dropdown-item" data-scroll href="comparison/salary.jsp">薪资对比 </a>
                <a class="dropdown-item" data-scroll href="comparison/final.jsp">汇算对比 </a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">个税优化</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <!-- Dropdown Choice -->
                <a class="dropdown-item" data-scroll href="optimizing/forsalary.jsp">薪资优化 </a>
                <a class="dropdown-item" data-scroll href="optimizing/forhome.jsp">家庭优化 </a>
              </div>
            </li>
            <li class="nav-item">
              <!-- Nav Link -->
              <a class="nav-link" data-scroll href="#contact-us">其他</a>
            </li>
          </ul>
        </div>
      </nav>
    </div>

    <!-- TOP SECTION -->
    <div class="container-fluid hero">
      <img src="images/hero.svg" alt="">
      <div class="container">
        <!-- Top Title -->
        <h1>个税<br>小帮手</h1>
        <!-- Top Title Info -->
        <p>走进职场第一步，<br> 个税计算要清楚。
          <br />
          <br />
        </p>
      </div>
    </div>
  </header>

  <!--  SECTION -->
  <section id="QA" class="QA">
    <div class="QA-aside">
      <img src="images/aside.svg" alt="">
    </div>
    <div class="container">
      <div class="row">
        <div class="col-12">
          <h2>个税那些事儿</h2>
        </div>
      </div>
      <div class="row">
        <div class="col-12 col-lg-4 work-box">
          <div class="photobox photobox_type10">
            <div class="photobox__previewbox">
              <!-- Replace Patch to Image Under -->
              <img src="images/q1.png" class="photobox__preview" alt="Preview">
              <!-- Replace Image Title Under -->
              <span class="photobox__label">困难补贴不属于免税收入，应按工资薪金所得缴纳个人所得税</span>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-4 work-box">
          <div class="photobox photobox_type10">
            <div class="photobox__previewbox">
              <!-- Replace Patch to Image Under -->
              <img src="images/q3.png" class="photobox__preview" alt="Preview">
              <!-- Replace Image Title Under -->
              <span class="photobox__label">该收入属于工伤保险待遇，免征个人所得税</span>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-4 work-box">
          <div class="photobox photobox_type10">
            <div class="photobox__previewbox">
              <!-- Replace Patch to Image Under -->
              <img src="images/q2.png" class="photobox__preview" alt="Preview">
              <!-- Replace Image Title Under -->
              <span class="photobox__label">生育津贴是属于生育保险性质的津贴，免征个人所得税</span>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12 col-lg-4 work-box">
          <div class="photobox photobox_type10">
            <div class="photobox__previewbox">
              <!-- Replace Patch to Image Under -->
              <img src="images/q4.png" class="photobox__preview" alt="Preview">
              <!-- Replace Image Title Under -->
              <span class="photobox__label">一、 2019年度已预缴税额大于年度应纳税额且申请退税的；<br >
			   二、 2019年度综合所得收入超过12万元且需要补税金额超过400元的;</span>
			  
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-4 work-box">
          <div class="photobox photobox_type10">
            <div class="photobox__previewbox">
              <!-- Replace Patch to Image Under -->
              <img src="images/q5.png" class="photobox__preview" alt="Preview">
              <!-- Replace Image Title Under -->
              <span class="photobox__label">2020年3月1日至6月30日</span>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-4 work-box">
          <div class="photobox photobox_type10">
            <div class="photobox__previewbox">
              <!-- Replace Patch to Image Under -->
              <img src="images/q6.png" class="photobox__preview" alt="Preview">
              <!-- Replace Image Title Under -->
              <span class="photobox__label">以年终奖收入除以12个月得到的数额，按照综合所得税率表，确定适用税率和速算扣除数，单独计算纳税</span>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12 more"></div>
      </div>
  </section>


  <!-- FOOTER SECTION -->
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
  <!-- Scripts -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
    integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
    crossorigin="anonymous"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/slick.min.js"></script>
  <script src="js/smooth-scroll.min.js"></script>
  <script src="js/main.js"></script>
  <!-- Scripts Ends -->
</body>

</html>