<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>衣服添加</title>
<link rel="stylesheet" href="/staticfile/css/addclothcss/shouye.css">

<style type="text/css">
	.Xcontent06 {
		
		width:400px;
		height: 500px;
		text-align: center;
	}
	.Xcontent13 {
		margin: 100px ;
	}
	.Xcontent24,.Xcontent25 {
		height: 30px;
		line-height: 30px;
		font-size: 1.6em;
	}
	input {
		height: 30px;
		line-height: 30px;
		font-size: 20px;;
	}
	select {
		width:100px;
		height: 30px;
		font-size: 20px; 
	}
	option {
		font-size: 20px;
	}
	#upload {
		width: 300px;
		margin-left: 20px;
		cursor: pointer;
	}
	#cvs {
		width: 600px;
		height: 100%;
	}
	.Xcontent {
		margin: 100px auto;
	}
	#save {
		position: absolute;
		bottom: 350px;
		left: 950px;
	}
	
	#back {
		position: absolute;
		bottom: 350px;
		left: 1150px;
	}
	body {
		background: url("/staticfile/images/addcloth.jpg") no-repeat center center;
		background-size: cover;
		min-width: 1010px;
		min-height: 850px;     
	}
</style>

</head>

<body>
<div class="Xcontent">
	
		<ul class="Xcontent01">
			
				<div class="Xcontent06">
					<img style="margin-top:100px;margin-left:150px;width:300px;height:300px;" src="http://image.uyiku.com/${cloth.id }.jpg" />
				</div>
				
				<ol class="Xcontent13">
					
					
					<!-- <div class="Xcontent17"> -->
						<!-- <p class="Xcontent18">售价</p>
						<p class="Xcontent19">￥<span>69.00</span></p> -->
						<div class="Xcontent23">
							
						</div>
						&nbsp;
						
						<div class="Xcontent23">
						<input type="hidden" name="uId" value="${cookie.userId.value}">
							<p class="Xcontent24">名称：</p>
							<p class="Xcontent25">${cloth.name}</p>
						</div>
						&nbsp;
						<div class="Xcontent23">
							<p class="Xcontent24">季节：</p>
							<p class="Xcontent25">
								${cloth.season}
							</p>
						</div>
						&nbsp;
					   <!-- </div> -->
					   <div class="Xcontent23">
						    <p class="Xcontent24">风格：</p>
						    <p class="Xcontent25">
						    	${cloth.style}
						    </p>
					   </div>
					    &nbsp;
					    <div class="Xcontent23">
						<p class="Xcontent24">分类：</p>
						<p class="Xcontent25">
							${cloth.category}
						</p>
					    </div>
					    &nbsp;
					      <div class="Xcontent23">
						<p class="Xcontent24">说明：</p>
						<p class="Xcontent25">
							${cloth.remark}
						</p>
					    </div>
					
			</ol>
		</ul>
		
	</div>
	
	<div id="back">
		<a href="toclothUpList.action?userId=${cookie.userId.value }"><img alt="" src="/staticfile/images/back.png"></a>
	</div>
<script type="text/javascript" class="autoinsert" src="staticFile/js/jquery-1.2.6.min.js"></script> 




<script>
//获取上传按钮
var input1 = document.getElementById("upload"); 
 
if(typeof FileReader==='undefined'){ 
     //result.innerHTML = "抱歉，你的浏览器不支持 FileReader"; 
     input1.setAttribute('disabled','disabled'); 
}else{ 
     input1.addEventListener('change',readFile,false); 
     /*input1.addEventListener('change',function (e){
     	console.log(this.files);//上传的文件列表
     },false); */
}
function readFile(){ 
	var file = this.files[0];//获取上传文件列表中第一个文件
	if(!/image\/\w+/.test(file.type)){
	//图片文件的type值为image/png或image/jpg
		alert("文件必须为图片！");
		return false; 
	} 
	// console.log(file);
	var reader = new FileReader();//实例一个文件对象
	reader.readAsDataURL(file);//把上传的文件转换成url
	//当文件读取成功便可以调取上传的接口
	reader.onload = function(e){ 
		// console.log(this.result);//文件路径
		// console.log(e.target.result);//文件路径
		/*var data = e.target.result.split(',');
		var tp = (file.type == 'image/png')? 'png': 'jpg';
		var imgUrl = data[1];//图片的url，去掉(data:image/png;base64,)
		//需要上传到服务器的在这里可以进行ajax请求
		// console.log(imgUrl);
		// 创建一个 Image 对象 
		var image = new Image();
		// 创建一个 Image 对象 
		// image.src = imgUrl;
		image.src = e.target.result;
		image.onload = function(){
			document.body.appendChild(image);
		}*/

		var image = new Image();
		// 设置src属性 
		image.src = e.target.result;
		var max=200;
		// 绑定load事件处理器，加载完成后执行，避免同步问题
		image.onload = function(){ 
			// 获取 canvas DOM 对象 
			var canvas = document.getElementById("cvs"); 
			// 如果高度超标 宽度等比例缩放 *= 
			/*if(image.height > max) {
				image.width *= max / image.height; 
				image.height = max;
			} */
			// 获取 canvas的 2d 环境对象, 
			var ctx = canvas.getContext("2d"); 
			// canvas清屏 
			ctx.clearRect(0, 0, canvas.width, canvas.height); 
			// 重置canvas宽高
			/*canvas.width = image.width;
			canvas.height = image.height;
			if (canvas.width>max) {canvas.width = max;}*/
			// 将图像绘制到canvas上
			// ctx.drawImage(image, 0, 0, image.width, image.height);
			ctx.drawImage(image, 0, 0, 200, 200);
			// 注意，此时image没有加入到dom之中
		};  
	}
};</script>
	
</body>
</html>