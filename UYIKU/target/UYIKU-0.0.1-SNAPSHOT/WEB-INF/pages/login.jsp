<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta http-equiv="Pragma" contect="no-cache">
	<title>UYK</title>

	<!-- <link rel="stylesheet" href="/staticfile/css/style.css"> -->

	<link rel="stylesheet" href="/staticfile/css/iconfont.css">
	<script src="/staticfile/js/jquery-3.1.1.js" />

	<script src="/staticfile/js/jquery.js"></script>
	<script type="text/javascript">
	
	
	 /* $(function(){
			$("#ruser").blur(function(){
				var name=$("#ruser").val();
				$("#span3").load("checkUsername.action",{username:name});
			})
		}) */
	</script>
	<style>
body, div, ul, ol, li, p, i, em, h1, h2, h3, h4, a, strong, span, img, form, input, textarea, button{
	padding: 0;
	margin:0;
}
body{
	font-family:"Microsoft YaHei", "Simsun", Tahoma, Arial,"Helvetica Neue","Hiragino Sans GB", "sans-self";
	font-size: 14px;
	line-height: 24px;
}
@font-face {font-family: 'iconfont';
    src: url('font/iconfont.eot'); /* IE9*/
    src: url('font/iconfont.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
    url('font/iconfont.woff') format('woff'), /* chrome、firefox */
    url('font/iconfont.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
    url('font/iconfont.svg#iconfont') format('svg'); /* iOS 4.1- */
}
input, textarea{
	outline: none;
}
li{
	list-style: none;
}
a{
	text-decoration: none;
	color: inherit;
}
img{
	border: 0;
}
.pr{
	position: relative;
}
.pa{
	position: absolute;
}
.pf{
	position: fixed;
}
.f-l{
	float: left;
}
.f-r{
	float: right;
}
li, div, ul{
	*zoom:1;
}
li:after, div:after, ul:after{
	content: '';
	display: table;
	clear: both;
}
.tran{
	transition:all 0.3s ease-out;
	-webkit-transition:all 0.3s ease-out;
	-moz-transition:all 0.3s ease-out;
	-o-transition:all 0.3s ease-out;
}
.container{
	width: 1000px;
	margin: 0 auto;
}
/*--------------样式重置------------*/
/***********/
body{background: url("/staticfile/images/welcome.jpg") no-repeat center center;
	background-size: cover;
	min-width: 1010px;
	min-height: 930px;
}

.login-box{
	width: 320px;
	overflow-x: hidden;
	position: absolute;
	top: 45%;
	left:50%;

	margin-left:-160px;
}
.box-con{
	width: 1600px;
}
.login-con{
	width: 300px;
	margin:0 10px; 
}
.login-box .form-group{
	margin-top: 20px;
}

.login-box input, .signup-form{
	width: 300px;
	height:50px;
	line-height: 48px \9;
	padding-left: 10px;
	border: 1px #d9d9d9 solid;
	border-radius: 5px;
	font-size: 14px;
	box-sizing:border-box;
	-webkit-box-sizing:border-box;
	-moz-box-sizing:border-box;
	transition:all 0.3s ease-out;
	-webkit-transition:all 0.3s ease-out;
	-moz-transition:all 0.3s ease-out;
}
.login-box input:focus{
	border-color: #03a9f4;
	box-shadow: 0 0 15px #03a9f4;
	-webkit-box-shadow: 0 0 15px #03a9f4;
	-moz-box-shadow: 0 0 15px #03a9f4;
}
.login-box button{
	width: 300px;
	height: 50px;
	line-height: 50px;
	font-size: 16px;
	border: 0;
	background-color: #03a9f4;
	color: #fff;
	border-radius: 5px;
}
.login-box button a{
	display: block;
}
.login-box button a:hover{
	padding-top: 3px;
}
.login-box button:hover{
	background-color: #0096da;
}
.from-line{
	height: 0;
	overflow: hidden;
	border-top: 1px #c2c2c2 solid;
	margin-top: 20px;
}
.a-tag{
	position: relative;
	display: block;
	height: 48px;
	border: 1px #c2c2c2 solid;
	text-align: center;
	line-height: 48px;
	color: #c2c2c2;
	border-radius: 5px;
	background-color: #fff;
}
.blue-border{
	border:1px #03a9f4 solid;
	color: #03a9f4;
}

.a-tag:hover{
	background-color: #aaa;
	color: #fff;
}
.blue-border:hover{
	background-color: #03a9f4;
	color: #fff;
}
.a-tag i{
	position: absolute;
	right: 20px;
	top: 0;
	font-size: 24px;
	color: #fff;
}
.a-tag:hover i{
	right: 10px;
}
.signup, .other-way, .mimachongzhi, .mobile-success{
	width: 300px;
	margin: 0 10px;
}


.signup-form {
	margin-top: 20px;
}
.signup-form input{
	border: 0;
	height: 48px;
	width: 220px;
}
.signup-form input:focus{
	box-shadow:0 0 0 #fff;
}
.signup-form.border{
	border-color: #03a9f4;
	box-shadow: 0 0 15px #03a9f4;
	-webkit-box-shadow: 0 0 15px #03a9f4;
	-moz-box-shadow: 0 0 15px #03a9f4;
}
.signup-form a{
	color: #03a9f4;
}
.view-clause{
	padding-top: 20px;
	line-height: 14px;
	text-align: center;
	color: #808080;
}
.view-clause a{
	color: #03a9f4;
}
.view-clause a:hover{
	text-decoration: underline;
}
a.reacquire{
	color: #c1c1c1;
}
.error-notic{
	color: #ff4e00;
	display: none;
}
.login-footer{
	position: absolute;
	bottom: 60px;
	width: 100%;
	text-align: center;
	color: #8f8f8f;
	font-size: 12px;
}
.login-footer h1{
	font-size: 18px;
	font-weight: normal;
}
.login-nav{
	width: 100%;
	height: 30px;
	background-color: rgba(0,0,0,0.7);
	color: #fff;
	border-bottom: 1px #c1c1c1 solid;
}
.login-nav ul{
	padding-right: 50px;
}
.login-nav li{
	float: left;
	line-height: 30px;
	padding: 0 10px;
}
.login-nav a:hover{
	text-decoration: underline;
	color: #03a9f4;
}
.mobile-success{
	padding-top: 20px;
}
.mobile-success p{
	text-align: center;
	color: #666;
}
.mobile-success p span{
	font-weight: bold;
	padding: 0 10px;
}
.mobile-success p a{
	color: #03a9f4;
	padding-left: 5px;
}
.mobile-success p a:hover{
	text-decoration: underline;
}
.loading{
	position: absolute;
	top: 10px;
	right: 20px;
	display: none;

}


</style>
</head>

<body>
	
	<div >

		<ul class="f-r">

			<li><a href="#"></a></li>

			<li><a href="#"></a></li>

			<li><a href="#"></a></li>

			<li><a href="#"></a></li>

			<li><a href="#"></a></li>

			<li><a href="#"></a></li>

		</ul>

	</div>

	
	<div class="login-banner"></div>
<!-- 登录 -->
	<form action="${pageContext.request.contextPath }/login.action" method="post">
	<div class="login-box">

		<div class="box-con tran">

			<div class="login-con f-l">

				<div class="form-group">

					<input id="luser" type="text" placeholder="用户名" name="username"/>

					<span  id="span1" class="error-notic">${msg}</span>

				</div>

				<div class="form-group">

					<input id="lpassword" type="password" placeholder="密码"name="password">


				</div>

				<div class="form-group">

					<button type="submit" class="tran pr">

						登录


					</button>

				</div>

				<div class="from-line"></div>

				<div class="form-group">

					<a href="javascript:;" class="move-signup a-tag tran blue-border">还没有帐号？免费注册</a>

				</div>

				

			</div>
	</form>
			


	<form action="${pageContext.request.contextPath }/regist.action" method="post">
			<div class="signup f-l">


				<div class="signup-email">

					<div class="form-group">

						<input id="ruser" type="text" placeholder="您的名字"  name="name">
						<span id="span3" class="error-notic">${msg}</span>
					</div>

					<div class="form-group">

						<input id="rpassowrd" type="password" placeholder="密码" name="password">


					</div>

					<div class="form-group">

						<button type="submit" class="tran pr">

							注册

							<img class="loading" src="images/loading.gif">

						</button>

					</div>

					

				</div>
				<div class="from-line"></div>

				<div class="form-group">

					<a href="javascript:;" class="move-login a-tag tran blue-border">已有帐号？登录</a>

			</div>

			</div>

			<!-- 注册 -->



			





		</div>

	</div>

	</form>

	<div class="login-footer">

		<h1>UYK</h1>

		<p>Copyright© 2017 Powered by http://www.uyiku.com/ </p>

		<p></p>

	</div>

	<script>
		//步骤切换

			var _boxCon=$(".box-con");

			$(".move-login").on("click",function(){

				$(_boxCon).css({

					'marginLeft':0

				})

			});

			$(".move-signup").on("click",function(){

				$(_boxCon).css({

					'marginLeft':-320

				})

			});

			$(".move-other").on("click",function(){

				$(_boxCon).css({

					'marginLeft':-640

				})

			});

			$(".move-reset").on("click",function(){

				$(_boxCon).css({

					'marginLeft':-960

				})

			});

			$("body").on("click",".move-addinf",function(){

				$(_boxCon).css({

					'marginLeft':-1280

				})

			});
			
		
		
	</script>

	

</body>

</html>