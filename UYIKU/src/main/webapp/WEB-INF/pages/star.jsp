<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>商品添加到收藏夹</title>
<link rel="stylesheet" type="text/css" href="/staticfile/css/starcss/reset.css">
<link rel="stylesheet" type="text/css" href="/staticfile/css/starcss/default.css">

<!--主要样式-->
<link rel="stylesheet" type="text/css" href="/staticfile/css/starcss/styles.css">

<!--[if IE]>
	<script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->
<style type="text/css">
 body {
	background: url("/staticfile/images/welcome.jpg") no-repeat center center;
	background-size: cover;
}

</style>

</head>
<body>

<div class="wrapper">
	<h1 class="title">潮品推送</h1>
	<span class="car"><i class="shopping-cart"></i></span>

	<div class="clear"></div>
	<!-- items -->
	
	<div class="items">
		<!-- single item -->
		<c:forEach items="${itemList }" var="item"> 
		<div class="item" style="height:350px">
			<img src="${item.imgUrl }" style="width:200px;height:200px" alt="item" />
			 <h2>${item.title }</h2>

			<p>热度: <em>${item.dnum }</em>
			</p>
			<button class="go-to-cart" type="button" onclick="window.open('${item.url}')">去店铺购买</button>
			<button class="add-to-cart" type="button">添加收藏夹</button>
		</div>
		</c:forEach>
		<!--/ single item -->
		
</div>
	
<script src="http://www.jq22.com/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src='/staticfile/js/starjs/jquery-ui.min.js'></script>
<script type="text/javascript">
$('.add-to-cart').on('click', function () {
	var cart = $('.shopping-cart');
	var imgtodrag = $(this).parent('.item').find('img').eq(0);
	if (imgtodrag) {
		var imgclone = imgtodrag.clone().offset({
			top: imgtodrag.offset().top,
			left: imgtodrag.offset().left
		}).css({
			'opacity': '0.5',
			'position': 'absolute',
			'height': '150px',
			'width': '150px',
			'z-index': '100'
		}).appendTo($('body')).animate({
			'top': cart.offset().top + 10,
			'left': cart.offset().left + 10,
			'width': 75,
			'height': 75
		}, 1000, 'easeInOutExpo');
		setTimeout(function () {
			cart.effect('shake', { times: 2 }, 200);
		}, 1500);
		imgclone.animate({
			'width': 0,
			'height': 0
		}, function () {
			$(this).detach();
		});
	}
});
</script>


</body>
</html>
