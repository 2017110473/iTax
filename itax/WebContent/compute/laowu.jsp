<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 张秋菊 -->
<html>
<head>
	<!-- Metas -->
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
							<a class="nav-link" data-scroll href="../index.jsp">主页</a>
						</li>
						<li class="nav-item dropdown active">
							<!-- Nav Link -->
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">个税计算</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="gongzi.jsp">工资薪金 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="nianzhongjiang.jsp">年终奖 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="laowu.jsp">劳务报酬 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="gaochou.jsp">稿酬所得 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="texu.jsp">特许使用 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="jingying.jsp">经营所得 </a>
								<!-- Lang Dropdown Choice -->
								<a class="dropdown-item" data-scroll href="qita.jsp">其他所得 </a>
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
			<h2>劳务报酬</h2>
			<!-- TOP Title Info -->
			<p>
			  应纳税所得额 = 稿酬所得(不超过4000元) - 800元<br />
                        应纳税所得额 = 稿酬所得(超过4000元) * (1-20%)  <br />       
                        纳税额 = 应纳税所得额 * 适用税率 - 速算扣除数
            </p>
		</div>
	</div>
	<!--  SECTION -->
	<section id="input" class="inputs">

		<div class="side-img">
			<img src="../images/aside3.svg" style="height:850px" alt="">
		</div>
		<div class="container">
			<div class="layui-tab">
				<ul class="layui-tab-title">  <!-- 选择框 -->
					<li class="layui-this" style="margin-left: 400px">正推税后</li>
					<li style="margin-left: 30px">反推税前</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<form class="layui-form" action="" lay-filter="form1">   <!-- 正推税前表单 -->
							<div class="layui-form-item">
							<!-- 输入 -->
								<label class="layui-form-label">税前收入：</label>
								<div class="layui-input-block">
									<input type="number" name="pre_tax" required lay-verify="required" placeholder="请输入金额"
										autocomplete="off" class="layui-input">
									<span class="unit">元</span>
									<input type="button" class="layui-btn" lay-submit lay-filter="formDemo1" id="compute1" value="计算" >
								</div>
							</div>
							<br />
							<!-- 输出结果 -->
							<div class="layui-form-item">
								<label class="layui-form-label">减除费用：</label>
								<div class="layui-input-block">
									<input type="text" name="subduction"  autocomplete="off"
										class="layui-input" disabled="">
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
									<input type="text" name="tax_rate" autocomplete="off"
										class="layui-input" disabled="">
									<span class="unit">%</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">速算扣除数：</label>
								<div class="layui-input-block">
									<input type="text" name="deduction"  autocomplete="off"
										class="layui-input" disabled="">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">预扣预缴应纳税额：</label>
								<div class="layui-input-block">
									<input type="text" name="tax"  autocomplete="off"
										class="layui-input" disabled="">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">税后收入：</label>
								<div class="layui-input-block">
									<input type="text" name="after_tax" autocomplete="off"
										class="layui-input" disabled="">
									<span class="unit">元</span>
								</div>
							</div>
						</form>
					</div>
					<div class="layui-tab-item">
						<form class="layui-form" action="" lay-filter ="form2">   <!-- 反推税前表单 -->
							<div class="layui-form-item">
							<!-- 输入 -->
								<label class="layui-form-label">税后收入：</label>
								<div class="layui-input-block">
									<input type="number" name="after_tax2" required lay-verify="required" placeholder="请输入金额"
										autocomplete="off" class="layui-input">
									<span class="unit">元</span>
									<input type="button" class="layui-btn" lay-submit lay-filter="formDemo2" id="compute2" value="计算" >
								</div>
							</div>
							<br />
							<!-- 输出结果 -->
							<div class="layui-form-item">
								<label class="layui-form-label">减除费用：</label>
								<div class="layui-input-block">
									<input type="text" name="subduction2"  autocomplete="off"
										class="layui-input" disabled="">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">预扣预缴应纳税所得额：</label>
								<div class="layui-input-block">
									<input type="text" name="taxable_income2"  autocomplete="off"
										class="layui-input" disabled="">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">适用税率：</label>
								<div class="layui-input-block">
									<input type="text" name="tax_rate2"  autocomplete="off"
										class="layui-input" disabled="">
									<span class="unit">%</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">速算扣除数：</label>
								<div class="layui-input-block">
									<input type="text" name="deduction2"  autocomplete="off"
										class="layui-input" disabled="">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">预扣预缴应纳税额：</label>
								<div class="layui-input-block">
									<input type="text" name="tax2"  autocomplete="off"
										class="layui-input" disabled="">
									<span class="unit">元</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">税前收入：</label>
								<div class="layui-input-block">
									<input type="text" name="pre_tax2" autocomplete="off"
										class="layui-input" disabled="">
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
	<script src="../layui/layui.all.js"></script>

	<script>
		//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function () {
			var element = layui.element;

			//…
		});
	</script>
	<script>
		layui.use('form', function () {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo1)', function (data) {
				//layer.msg(JSON.stringify(data.field));
				return false;
			});
		});
		
		//正推税前
		layui.$('#compute1').on('click',function(){  
			var form = layui.form;
			var pre_tax = parseFloat(form.val('form1').pre_tax);	
			var tax_rate, taxable_income, deduction, tax, after_tax, subduction;
			
			if(pre_tax<=0) {       //收入金额必须为正
				alert("收入金额必须为正");
				return false;
			}	
			else if(pre_tax<=800){     //税前收入小于800，无需纳税
				subduction=pre_tax;
				taxable_income = 0;
				tax_rate = 0;
				deduction = 0;
				tax = 0;
				after_tax = pre_tax;
				
			}
			else if(pre_tax<=20000){      //税前收入小于20000，按20%纳税
				if(pre_tax<=4000) subduction = 800;   //税前收入小于4000，则减除800，否则减除20%
				else subduction = pre_tax* 0.2;
				taxable_income = pre_tax - subduction;
				tax_rate = 20;
				deduction = 0;
				tax = taxable_income*0.2 - deduction;
				after_tax = pre_tax-tax;
				
			}
			else if(pre_tax <=50000)   //税前收入小于50000，减除20%，按30%纳税
				{
				subduction = pre_tax* 0.2;
				taxable_income = pre_tax - subduction;
				tax_rate = 30;
				deduction = 2000;
				tax = taxable_income*0.3 - deduction;
				after_tax = pre_tax - tax;
				}
			else{                         //税前收入大于50000，减除20%，按40%纳税
				subduction = pre_tax* 0.2;
				taxable_income = pre_tax - subduction;
				tax_rate = 40;
				deduction = 7000;
				tax = taxable_income*0.4 - deduction;
				after_tax = pre_tax - tax;
			}
			form.val('form1', {   //结果返回
				"taxable_income": (taxable_income).toFixed(2)		
        		, "subduction" :(subduction).toFixed(2)
        		, "tax_rate" : tax_rate
        		, "deduction" : (deduction).toFixed(2)
        		, "tax" : (tax).toFixed(2)
        		, "after_tax" : (after_tax).toFixed(2)		
      	 	});	
			});
		
		//反推税前
		layui.$('#compute2').on('click',function(){  
			var form = layui.form;
			var after_tax2 = parseFloat(form.val('form2').after_tax2);	
			var tax_rate2, taxable_income2, deduction2, tax2, pre_tax2, subduction2;
			
			if(after_tax2 <= 0) {       //收入金额必须为正
				alert("收入金额必须为正");
				return false;
			}	
			else if(after_tax2<=800){     //税后收入小于800，对应于税前无需纳税
				tax_rate2 = 0;
				subduction2 = after_tax2;
				deduction2 = 0;
				pre_tax2 = after_tax2;
				taxable_income2 =0;
				tax2 = 0;
				}
			else if(after_tax2 <=3360){   //税后收入3360对应于税前4000
				tax_rate2 = 20;
				subduction2 = 800;
				deduction2 = 0;;
				pre_tax2 = (after_tax2 - 160)/ 0.8;
				taxable_income2 = pre_tax2 - subduction2;
				tax2 = taxable_income2 * 0.2;
			}
			else if(after_tax2 <= 16800){  //税后收入16800对应于税前20000
				tax_rate2 = 20;
				pre_tax2 = after_tax2 / 0.84;
				subduction2 = pre_tax2 * 0.2;
				deduction2 = 0;
				taxable_income2 = pre_tax2 - subduction2;
				tax2 = taxable_income2 * 0.2;
			}
			else if(after_tax2 <= 40000){    //税后收入40000对应于税前50000
				tax_rate2 = 30;
				deduction2 = 2000;
				pre_tax2 =(after_tax2 - deduction2) / 0.76;
				subduction2 = pre_tax2 * 0.2;
				taxable_income2 = pre_tax2 - subduction2;
				tax2 = taxable_income2 * 0.3- deduction2;
			}
			else{                    
				tax_rate2 = 40;
				deduction2 = 7000;
				pre_tax2 =(after_tax2 - deduction2) / 0.68;
				subduction2 = pre_tax2 * 0.2;
				taxable_income2 = pre_tax2 - subduction2;
				tax2 = taxable_income2 * 0.4- deduction2;
			}
			form.val('form2', {         //结果返回
				"taxable_income2": (taxable_income2).toFixed(2)		
	    		, "subduction2" : (subduction2).toFixed(2)
	    		, "tax_rate2" : tax_rate2
	    		, "deduction2" : (deduction2).toFixed(2)
	    		, "tax2" : (tax2).toFixed(2)
	    		, "pre_tax2" : (pre_tax2).toFixed(2)		
	  	 	});	
			});
		
	</script>
	<!-- Scripts Ends -->
</body>

</html>