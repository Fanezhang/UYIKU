<!DOCTYPE html>
<head>
	<meta http-equiv="text/html" charset="utf-8">
	<script src="staticFile/js/jquery-3.1.1.js"></script>
</head>
<body>
	
	<script type="text/javascript">
		function tz(){
				alert("开启爬虫成功！可以关闭浏览器了");
				<!-- $.ajax({url:"go",async:true});--> 
				window.location.href="go"; 
				window.close();
		}
	</script>
	<div style="width:100%">
	<h1 align="center" >淘宝爬虫程序V1.0</h1>
	<button onclick="tz()" style="width:200px;height:100px;margin-left: 43%;margin-top:100px;"><font size="10px">开爬</font></button> 
	</div>
</body>
</html>
