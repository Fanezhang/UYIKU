<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">

<title>UYK</title>

<link rel="stylesheet" href="/staticfile/css/bootstrap.min.css">
<link href="/staticfile/css/coolShow.css" rel="stylesheet" type="text/css" />
<script src="/staticfile/js/jquery-3.1.1.js"></script>
<script src="/staticfile/js/bootstrap.min.js"></script>
<script type="text/javascript" src = "/staticfile/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src = "/staticfile/js/coolShow.js"></script>

<style type="text/css">
body {
	background-image: url('/staticfile/images/show.jpg');
	background-size:100% 100%;
}

#nav1 {
/* 	background-color: #ff6; */
	background-color: rgb(242,224,210);
}

#leftDiv {
	width: 100px;
	height: 1000px;
/* 	background-color: #ff4; */
	padding-top: 50px;
	padding-left:60px;
}

#clothup, #clothdown, #shoes, #bag, #shiping {
	width: 100px;
	height: 100px;
/* 	background-color: #f00; */
	margin: 50px auto;
	line-height: 100px;
	text-align: center;
	padding-top: 10px;
}

#img1:hover {
	width: 100px;
	height: 100px;
} 
#img2:hover {
	width: 100px;
	height: 100px;
} 
#img3:hover {
	width: 100px;
	height: 100px;
} 
#img4:hover {
	width: 100px;
	height: 100px;
} 
#img5:hover {
	width: 100px;
	height: 100px;
} 

#titleDiv {
/* 	background-color: #ff3; */
	height: 100px;
	width: 500px;
	margin: 10px auto;
	position: absolute;
	left: 700px;
	top: 51px;
}

#titlep {
	height: 100px;
	line-height: 100px;
	text-align: center;
	font-size: 1.6em;
}

#show {
/* 	background-color: #ff3; */
	width: 1500px;
	height: 800px;
	position: absolute;
	left: 250px;
	top: 251px;
}
#coolShow{
	width:400px;
	height:400px;
	margin-left:12%;
}

</style>

</head>

<body>
	<nav id="nav1" class="navbar navbar-default navbar-fixed-top"
		role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="togarde.action">导航页面 &nbsp;||</a>
	</div>
	<div>
		<ul class="nav navbar-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle "
				data-toggle="dropdown"> 季节 <b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="clothTag?category=up&season=springAutumn&userId=${cookie.userId.value}&jsp=clothUpList">春秋</a></li>
					<li><a href="clothTag?category=up&season=summer&userId=${cookie.userId.value}&jsp=clothUpList">夏</a></li>
					<li><a href="clothTag?category=up&&season=winter&userId=${cookie.userId.value}&jsp=clothUpList">冬</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> 风格 <b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="clothTag?category=up&style=sport&userId=${cookie.userId.value}&jsp=clothUpList">运动</a></li>
					<li><a href="clothTag?category=up&style=relax&userId=${cookie.userId.value}&jsp=clothUpList">休闲</a></li>
					<li><a href="clothTag?category=up&style=work&userId=${cookie.userId.value}&jsp=clothUpList">正式</a></li>
				</ul></li>
		</ul>
	</div>
	<div>
		<ul class="nav navbar-nav">
			<li class="dropdown"><a href="toCreate">添加单品</a></li>
		</ul>
		
	</div>
	</nav>
	<div id="leftDiv">
		<div id="clothup">
			<a href="clothTag?category=up&userId=${cookie.userId.value}&jsp=clothUpList"> <img id="img1"
				src="/staticfile/images/up.jpg" width="80px"
				height="80px">
			</a>
		</div>
		<div id="shiping">
			<a href="clothTag?category=shipin&userId=${cookie.userId.value}&jsp=clothShipinList"> <img id="img2"
				src="/staticfile/images/shipin.jpg" width="80px"
				height="80px">
			</a>
		</div>
		<div id="bag">
			<a href="clothTag?category=bag&userId=${cookie.userId.value}&jsp=clothBagList"> <img id="img3"
				src="/staticfile/images/bag.jpg" width="80px"
				height="80px">
			</a>
		</div>
		<div id="shoes">
			<a href="clothTag?category=shoes&userId=${cookie.userId.value}&jsp=clothShoesList"> <img id="img4"
				src="/staticfile/images/shoes.jpg" width="80px"
				height="80px">
			</a>
		</div>
		<div id="clothdown">
			<a href="clothTag?category=down&userId=${cookie.userId.value}&jsp=clothDownList"> <img id="img5"
				src="/staticfile/images/down.jpg" width="80px"
				height="80px">
			</a>
		</div>
	</div>
	<div id="titleDiv">
		<p id="titlep"></p>
	</div>
	<div id="show">
		<div class = "main">
			<div id = "coolShow"></div>
			<div id = "handBar"></div>
		</div>
	</div>
	<script type="text/javascript">
	/*
	定义需要展示的图片以及图片的展示时间
	*/
	$(document).ready(function() { 
	$('#coolShow').coolShow({
		imgSrc:['/images/1.png','/images/2.png','/images/3.png'],
		speed:40
		});
	});
</script>
</body>

</html>