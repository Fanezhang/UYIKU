<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="/staticfile/js/jquery-1.7.2.min.js"></script>
<title>jquery突显图片效果</title>

<style type="text/css">
body {
	background-image: url('/staticfile/images/welcome.jpg');
	background-size:100% 100%;
}

body, div, ul, li, img {
	padding: 0;
	margin: 0;
	border: 0;
	list-style: none;
}

.all {
	width: 1050px;
	border: 1px solid #ccc;
	margin: 300px auto;
	overflow: hidden;
	padding: 10px 0 0 10px;
}

li {
	width: 200px;
	height: 186px;
	float: left;
	margin-right: 10px;
	margin-bottom: 10px;
	cursor: pointer;
}

.side-bar a, .chat-tips i {
	background: url(right_bg.png) no-repeat;
}

.side-bar {
	width: 66px;
	position: fixed;
	bottom: 20px;
	right: 25px;
	font-size: 0;
	line-height: 0;
	z-index: 100;
}

.side-bar a {
	width: 66px;
	height: 66px;
	display: inline-block;
	background-color: #ddd;
	margin-bottom: 2px;
}

.side-bar .back {
	background-position: 0 -62px;
}
#back{
	position: absolute;
	bottom:60px;
	right:100px;
}
</style>


<script type="text/javascript">
	$(function() {

		$('li').mouseover(function(e) {

			$(this).siblings().stop().fadeTo(500, 0.4);

		});

		$('li').mouseout(function(e) {

			$(this).siblings().stop().fadeTo(500, 1);

		});
	})
</script>

</head>

<body>
	<div class="all" id="box">
		<ul>
<%-- 			<c:forEach items="${planList}" var="p">
				<li>
					<a href="*******/plan/findoneplan?id=${p.id}">
						<img src="${p.imgUrl}"/>
					</a>
				</li>
			</c:forEach>
 --%>		
 			<a href="toplaneInfo.action">
			<li><img src="images/suits/suit1.jpg" width="200" height="186" /></li>
			</a>
			<a href="toplaneInfo.action">
			<li><img src="images/suits/suit2.jpg" width="200" height="186" /></li>
			</a>
			<a href="toplaneInfo.action">
			<li><img src="images/suits/suit3.jpg" width="200" height="186" /></li>
			</a>
			<a href="toplaneInfo.action">
			<li><img src="images/suits/suit4.jpg" width="200" height="186" /></li>
			</a>
			<a href="toplaneInfo.action">
			<li><img src="images/suits/suit5.jpg" width="200" height="186" /></li>
			</a>
			<a href="toplaneInfo.action">
			<li><img src="images/suits/suit6.jpg" width="200" height="186" /></li>
			</a>
			<a href="toplaneInfo.action">
			<li><img src="images/suits/suit7.jpg" width="200" height="186" /></li>
			</a>
			<a href="toplaneInfo.action">
			<li><img src="images/suits/suit8.jpg" width="200" height="186" /></li>
			</a>
			<a href="toplaneInfo.action">
			<li><img src="images/suits/suit9.jpg" width="200" height="186" /></li>
			</a>
			<a href="toplaneInfo.action">
			<li><img src="images/suits/suit10.jpg" width="200" height="186" /></li>
			</a>
			
		</ul>
	</div>
	<div id="back">
		<a href="togarde.action"><img src="/staticfile/images/back.png"></a>
	</div> 
</body>
</html>