<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
							<a class="nav-link" data-scroll href="../index.html">主页</a>
						</li>
						<li class="nav-item dropdown active">
							<!-- Nav Link -->
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">个税计算</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="gongzi.html">工资薪金 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="nianzhongjiang.html">年终奖 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="laowu.html">劳务报酬 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="gaochou.html">稿酬所得 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="texu.html">特许使用 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="jingying.html">经营所得 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="qita.html">其他所得 </a>
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
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">个税优化</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<!-- Dropdown Choice -->
							<a class="dropdown-item" data-scroll href="../optimizing/forsalary.html">薪资优化 </a>
							<a class="dropdown-item" data-scroll href="../optimizing/forhome">家庭优化 </a>
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
	</header>
	<!-- TOP SECTION -->
	<div class="container-fluid aboutimg">
		<img src="../images/aboutimg.svg" alt="">
		<div class="container">

			<!-- TOP Title -->
			<h2>稿酬所得</h2>
			<!-- TOP Title Info -->

			<br />
			<br />
		</div>
	</div>
	<!--  SECTION -->
	<!--  SECTION -->
	<section id="input" class="inputs">

		<div class="side-img">
			<img src="../images/aside3.svg" style="height: 850px;" alt="">
		</div>
		<div class="container">
			<div class="layui-tab">
				<ul class="layui-tab-title">
					<li class="layui-this" style="margin-left: 400px">正推税后</li>
					<li style="margin-left: 30px">反推税前</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<form class="layui-form" action="" lay-filter="form1">
							<div class="layui-form-item">
								<label class="layui-form-label">税前收入：</label>
								<div class="layui-input-block">
									<input type="number" name="pre_tax" required lay-verify="required" placeholder="请输入金额"
										autocomplete="off" class="layui-input">
									<span class="unit">元</span>
									<input type="button" class="layui-btn" lay-submit lay-filter="formDemo1" id="compute1" value="计算" >
								</div>
							</div>
							<br />
							<div class="layui-form-item">
								<label class="layui-form-label">减除费用：</label>
								<div class="layui-input-block">
									<input type="text" name="subduction"  autocomplete="off"
										class="layui-input">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">预扣预缴应纳税所得额：</label>
								<div class="layui-input-block">
									<input type="text" name="taxable_income"  autocomplete="off"
										class="layui-input">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">适用税率：</label>
								<div class="layui-input-block">
									<input type="text" name="tax_rate"  autocomplete="off"
										class="layui-input">
									<span class="unit">%</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">预扣预缴应纳税额：</label>
								<div class="layui-input-block">
									<input type="text" name="tax"  autocomplete="off"
										class="layui-input">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">税后收入：</label>
								<div class="layui-input-block">
									<input type="text" name="after_tax" autocomplete="off"
										class="layui-input">
									<span class="unit">元</span>
								</div>
							</div>
						</form>
					</div>
					<div class="layui-tab-item">
						<form class="layui-form" action=""  lay-filter="form2">
							<div class="layui-form-item">
								<label class="layui-form-label">税后收入：</label>
								<div class="layui-input-block">
									<input type="number" name="after_tax2" required lay-verify="required" placeholder="请输入金额"
										autocomplete="off" class="layui-input">
									<span class="unit">元</span>
									<input type="button" class="layui-btn" lay-submit lay-filter="formDemo2" id="compute2" value="计算" >
								</div>
							</div>
							<br />
							<div class="layui-form-item">
								<label class="layui-form-label">减除费用：</label>
								<div class="layui-input-block">
									<input type="text" name="subduction2"  autocomplete="off"
										class="layui-input">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">预扣预缴应纳税所得额：</label>
								<div class="layui-input-block">
									<input type="text" name="taxable_income2" autocomplete="off"
										class="layui-input">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">适用税率：</label>
								<div class="layui-input-block">
									<input type="text" name="tax_rate2"  autocomplete="off"
										class="layui-input">
									<span class="unit">%</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">预扣预缴应纳税额：</label>
								<div class="layui-input-block">
									<input type="text" name="tax2"  autocomplete="off"
										class="layui-input">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">税前收入：</label>
								<div class="layui-input-block">
									<input type="text" name="pre_tax2"  autocomplete="off"
										class="layui-input">
									<span class="unit">元</span>
								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</section>


	<!-- FOOTER SECTION -->
	<footer style="margin-top: 50px;">
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
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/slick.min.js"></script>
	<script src="../js/smooth-scroll.min.js"></script>
	<script src="../js/main.js"></script>
	<script src="../layui/layui.all.js"></script>

	<script>
		layui.use('element', function () {
			var element = layui.element;
		});
	</script>
	<script>
		//Demo
		layui.use('form', function () {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo)', function (data) {
				layer.msg(JSON.stringify(data.field));
				return false;
			});
		});
		//正推税前
		layui.$('#compute1').on('click',function(){  //compute是计算button的id
			var form = layui.form;
			var pre_tax = parseFloat(form.val('form1').pre_tax);	
			var tax_rate, taxable_income, subduction, tax, after_tax;
			
			if(pre_tax<=0) {       //收入金额必须为正
				alert("收入金额必须为正");
				return false;
			}	
			else if(pre_tax <= 800){
				subduction = pre_tax;
				taxable_income = 0;
				tax_rate = 0;
				tax = 0;
				after_tax = pre_tax;
				
			}
			else if(pre_tax <= 4000){
				subduction = 800;
				taxable_income = pre_tax - subduction;
				tax_rate = 14;
				tax = taxable_income * 0.14 ;
				after_tax = pre_tax - tax;
				
			}
			else{
				subduction = pre_tax * 0.2;
				taxable_income = pre_tax - subduction;
				tax_rate = 14;
				tax = taxable_income * 0.14;
				after_tax = pre_tax - tax;
			}
			form.val('form1', {
				"taxable_income": (taxable_income).toFixed(2)		
        		, "tax_rate" : tax_rate
        		, "subduction" : (subduction).toFixed(2)
        		, "tax" : (tax).toFixed(2)
        		, "after_tax" : (after_tax).toFixed(2)		
      	 	});	
			});
		
		//反推税前
		layui.$('#compute2').on('click',function(){  //compute2是计算button的id
			var form = layui.form;
			var after_tax2 = parseFloat(form.val('form2').after_tax2);	
			var tax_rate2, taxable_income2, subduction2, tax2, pre_tax2;
			
			if(after_tax2 <= 0) {       //收入金额必须为正
				alert("收入金额必须为正");
				return false;
			}	
			else if(after_tax2 <= 800){
				tax_rate2 = 0;
				subduction2 = after_tax2;
				pre_tax2 = after_tax2;
				taxable_income2 = 0;
				tax2 = 0;
				}
			else if(after_tax2 <= 3552){
				tax_rate2 = 14;
				subduction2 = 800;
				pre_tax2 = (after_tax2 - 112) / 0.86;
				taxable_income2 =pre_tax2 - subduction2;
				tax2 = taxable_income2 * 0.14;
			}
			else{
				tax_rate2 = 14;
				pre_tax2 = after_tax2 / 0.888;
				subduction2 = pre_tax2 * 0.2;
				taxable_income2 =pre_tax2 * 0.8;
				tax2 = taxable_income2 * 0.14;
			}
			form.val('form2', {
				"taxable_income2": (taxable_income2).toFixed(2)		
	    		, "tax_rate2" : tax_rate2
	    		, "subduction2" : (subduction2).toFixed(2)
	    		, "tax2" : (tax2).toFixed(2)
	    		, "pre_tax2" : (pre_tax2).toFixed(2)		
	  	 	});	
			});
	</script>
	<!-- Scripts Ends -->
</body>

</html>