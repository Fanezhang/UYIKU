<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>排骨图</title>
		<link rel="stylesheet" href="/staticfile/css/ribs.css" />
		<script type="text/javascript" src="/staticfile/js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="/staticfile/js/jquery.SuperSlide.2.1.1.js"></script>
		<!--[if IE]><script type="text/javascript" src="js/excanvas.js" ></script><![endif]-->
		<script type="text/javascript" src="/staticfile/js/ribs.js"></script>

		<script>
		
			var mydata = [
			{	//春秋cq 夏x1 冬d 正式zs 休闲xx 运动yd 上衣sy 下衣xy 鞋x 包b 首饰ss
				"dsr":{"name":"单品","sfzjhm":"232103198903061222"},
				"controlled":{"all":${clothNum},"cq":${springAutumn},"x1":${summer},"d":${winter},"zs":${workNum},"xx":${relaxNum},"yd":${sportNum}},
				"uncontrolled":{"sy":${up},"xy":${down},"b":${bag},"ss":${ornament},"x":${shoes}}
			},{
				"dsr":{"name":"套装","sfzjhm":"232103198903061222"},
				"controlled":{"zs":${planworkNum},"xx":${planrelaxNum},"yd":${sportNum}},
				"uncontrolled":{"all":${planNum},"cq":${planspringAutumn},"x1":${plansummer},"d":${planwinter}}
			}
			];
			$(function() {
				//首页
				$(".ribs").ribs(mydata);
				
			});
		</script>
		<style type="text/css">
			body{
					background: url("/staticfile/images/addcloth.jpg") no-repeat;
					background-size:100% 150%;
				}
				
		</style>
	</head>

	<body>
		<!--财产首页 排骨图-->
		<div class="ribs" style="margin-top: 100px;">
		</div>
		<a href="togarde.action" style="position: absolute;right:100px">
			<img alt="" src="/staticfile/images/back.png">
		</a>
	</body>

</html>