<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Pragma" contect="no-cache">
<link href="/staticfile/css/bootstrap.min.css" rel="stylesheet">
<style>
iframe {
	opacity: 0;
}
a, input, div, textarea {
	outline: none;
}
html, body, h1, h2, h3, h4, ul, li, ol, dl, dt, dd, form, p, input, textarea {
	margin: 0;
	padding: 0;
}
ul, dl, ol, li {
	list-style: none;
}
html {
	height: 100%;
}
body {
	font-family: "Helvetica", "微软雅黑", "华文细黑", "黑体";
	font-size: 12px;
	color: #000;
	-webkit-text-size-adjust: none;
	position: relative;
	height: 100%;
}
img {
	border: none;
}
h1, h2, h3 {
	font-weight: normal;
}
.clear {
	clear: both;
}
a {
	text-decoration: none;
}

@-webkit-keyframes flipintoright {
0% {
	transform: scale(1,1);
}
40% {
	transform: scale(1.2,1.2);
}
100% {
	transform: scale(1.1,1.1);
}
}

@-webkit-keyframes flipintoright2 {
0% {
	transform: scale(1.1,1.1);
}
100% {
	transform: scale(1,1);
}
}

body {
	background: url("/staticfile/images/welcome.jpg") no-repeat center center;
	background-size: cover;
	min-width: 1010px;
	min-height: 660px;
}

.page-main {
	background: url("img/bg02_summer.jpg") no-repeat center center;
	background-size: cover;
	height: 100%;
	min-width: 1020px;
}

.page-blockList {
	position: absolute;
	top: 55%;
	left: 50%;
	margin-top: -200px;
	margin-left: -500px;
	width: 1020px;
}
.page-block {
	width: 200px;
	height: 400px;
	background: #fff;
	float: left;
	margin-right: 50px;
	position: relative;
	cursor: pointer;
	display: block;
	border-radius: 5px;
	-webkit-animation-name: flipintoright2;
	-webkit-animation-duration: 300ms;
	animation-name: flipintoright2;
	animation-duration: 300ms;
}
.page-blockList .page-block:last-child {
	margin-right: 0;
}

.page-block:last-child {
	margin-right: 0px;
}

.page-block:hover {
	-webkit-animation-name: flipintoright;
	-webkit-animation-duration: 300ms;
	animation-name: flipintoright;
	animation-duration: 300ms;
	transform: scale(1.1,1.1);
}
.page-block > .bigIcon {
	height: 145px;
	background: url("img/icon1.png") no-repeat center center;
	background-color: #BCB5B6;
	-webkit-transition: background-color 0.5s ease-out;
	border-radius: 5px 5px 0 0;
}
.page-block:hover > .bigIcon {
	background-color: #e94f78;
}

.page-block > .bigIcon.icon1 {
	background-image: url("/staticfile/images/clothes.png");
}
.page-block:hover > .bigIcon.icon1 {
	background-image: url("/staticfile/images/clothes.png");
}
.page-block > .bigIcon.icon2 {
	background-image: url("/staticfile/images/collocation.png");
}
.page-block:hover > .bigIcon.icon2 {
	background-image: url("/staticfile/images/collocation.png");
}
.page-block > .bigIcon.icon3 {
	background-image: url("/staticfile/images/statistics.png");
}
.page-block:hover > .bigIcon.icon3 {
	background-image: url("/staticfile/images/statistics.png");
}
.page-block > .bigIcon.icon4 {
	background-image: url("/staticfile/images/recommend.png");
}
.page-block:hover > .bigIcon.icon4 {
	background-image: url("/staticfile/images/recommend.png");
}


.page-block .title {
	font-size: 20px;
	padding: 12px 12px 0px 12px;
	color: #5a5a5a;
	font-weight: bold;
}
.page-block .desc {
	font-size: 12px;
	padding: 8px 12px 0px 12px;
	color: #a1a1a1;
	line-height: 21px;
}



.page-block .image {
	width: 99px;
	height: 78px;
	position: absolute;
	right: 10px;
	bottom: 10px;
}

.page-logo {
	display: block;
	position: absolute;
	top: -190px;
	left: 50%;
	margin-left: -165px;
	height: 148px;
	width: 331px;
	background: url("img/logo02_summer.png") no-repeat center center;
}

.page-footer {
	position: absolute;
	bottom: 60px;
	width: 100%;
	text-align: center;
	color: #8f8f8f;
	font-size: 12px;
}

.page-clearLocal {
	color: #555;
}

.page-logos {
	position:absolute;
	left: 50%;
	bottom: -70px;
	margin-left: -180px;
}
.page-logos > img {
	margin-right: 13px;
}
a.downbtn{
	margin-left: 10px;
	color: #fff;
}
a.downbtn:hover{
	color: #8f8f8f;
}

#imgHead{
	position: absolute;
	top: 7%;
	right:25%;
	width:135px;
	height:135px;
}
#imgHead img{
	width:100%;
	height:100%;
}
#back{
	position: absolute;
	right:100px;
	bottom:100px;
}
</style>
<meta charset="utf-8">
<title>UYK</title>
<script type="text/javascript">
if(${cookie.userUrl.value}==null){
	window.location.reload();
}
</script>

</head>

<body>

<div class="page-main">
			<div id="imgHead"><img class="img-circle" src="http://${cookie.userUrl.value}"></div>
			
			
			<div class="page-blockList">
				
				<a href="toclothUpList.action?userId=${cookie.userId.value}" class="page-block" target="_self">
					<div class="bigIcon icon1"></div>
					<div class="title">私人衣橱</div>
					<div class="desc">这里提供各种个性化的标签,方便您快速标记和收纳你的衣服,为您建立无限量的云中衣橱.</div>
					
				</a>
				<a href="tosuitList.action?userId=${cookie.userId.value }" class="page-block" target="_self">
					<div class="bigIcon icon2"></div>
					<div class="title">套装搭配</div>
					<div class="desc">告别纠结,保留经典,自主定制套装.为您,也为您心爱的他.</div>
					
				</a>
				<a href="countCloth.action?userId=${cookie.userId.value }" class="page-block" target="_self">
					<div class="bigIcon icon3"></div>
					<div class="title">衣橱统计</div>
					<div class="desc">智能管理衣橱,管理搭配,随时了解衣橱情况.极大提高衣橱管理和穿衣决策效率.</div>
					
				</a>
				<a href="tostar.action?userId=${cookie.userId.value }" class="page-block" target="_self">
					<div class="bigIcon icon4"></div>
					<div class="title">明星推荐</div>
					<div class="desc">无论是工作中,还是shopping时,只要您遇到穿什么,和怎么搭配的问题时,都可以在这里找到最时尚的搭配方案.</div>
					
				</a>
				
			
			</div>
			<div id="back">
				<a href="index.jsp"><img src="/staticfile/images/back.png" /></a>
			</div>
		</div>
		
		<div class="page-footer">@穿云箭项目组版权所有 杭IQ备88888888号-8 </div>

</body>
</html>

