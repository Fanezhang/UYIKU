<%@ page language="java" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- 不缓存 -->
<meta http-equiv="Pragma" contect="no-cache">
<title>图像上传</title>

<style type="text/css">

body {
	background:url("/staticfile/images/countBackground.jpg") no-repeat center center;
	background-size:100% 100%;

}
.con4{
     width: 300px;
     height: auto;
     overflow: hidden;
     margin: 200px auto;
     color: #FFFFFF;
}
.con4 .btn{
     width: 100%;
     height: 40px;
     line-height: 40px;
     text-align: center;
     background: #d8b49c;
     display: block;
     font-size: 16px;
     border-radius: 5px;
}
.upload{
     float: left;
     position: relative;
}
.upload_pic{
     display: block;
     width: 100%;
     height: 40px;
     position: absolute;
     left: 0;
     top: 0;
     opacity: 0;
     border-radius: 5px;
}
#cvs{
	border: 2px solid #fff;
	margin:20px 0 20px 50px;
	background: url("/staticfile/images/headback.jpg");
	background-size:100% 100%;
}

#upload,#sb,#tg{
	cursor: pointer; 
	
}

#atg{
	color:#fff;
	text-decoration: none;
}
</style>
</head>
<body>
<div style="height:900px; width:100%">
<div class="con4">
    <canvas id="cvs" width="200" height="200"></canvas>
    <form action="${pageContext.request.contextPath }/addhead.action" method="post" enctype="multipart/form-data">
    <span>
    	<input type="hidden" name="userId" value="${cookie.userId.value}" />
    </span>
    <span class="btn upload">
        	上传头像
     <input type="file" class="upload_pic" id="upload" name="file" />
    </span>
    <div>&nbsp;</div>
    <span class="btn upload">
        	提交
     <input type="submit" class="upload_pic" id="sb" />
    </span>
    <div>&nbsp;</div>
    <a href="skipAddHead?userId=${cookie.userId.value}" id="atg">
    <span class="btn upload" id="tg">
        	跳过
    </span>
    </a>
    <input type="hidden" value="${userName }" name="userName">
    </form>
</div>
</div>

<script type="text/javascript" class="autoinsert" src="/staticfile/js/jquery-1.2.6.min.js"></script> 

<script src="/staticfile/js/snowfall.jquery.js"></script> 

<script>

        $(document).snowfall('clear');

        $(document).snowfall({

            image: "/staticfile/images/huaban.png",

            flakeCount:30,

            minSize: 5,

            maxSize: 22

        });

    </script>
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