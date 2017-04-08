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
<link type="text/css" rel="Stylesheet" href="/staticfile/css/clothDownCss/imageflow.css" />
<script type="text/javascript" src="/staticfile/js/clothDownJs/jquery.js"></script>
<script type="text/javascript" src="/staticfile/js/clothDownJs/imageflow.js"></script>
<script src="/staticfile/js/jquery-3.1.1.js"></script>
<script src="/staticfile/js/bootstrap.min.js"></script>


<style type="text/css">
body {
	background-image: url('/staticfile/images/welcome.jpg');
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
#show {

	overflow:hidden; 

	-ms-touch-action:none;

	-ms-content-zooming:none;

}

#inshow {

	position:absolute;

	margin:0px;

	padding:0px;

/* 	background:#fff; */

	width:100%;

	height:100%;

}

#canvas {

	position:absolute;

	width:100%;

	height:100%;

/* 	background:#fff; */

}

</style>

<script type="text/javascript" src="/staticfile/js/ge1doot.js"></script>

<script type="text/javascript">



"use strict";



(function () {

	/* ==== definitions ==== */

	var diapo = [], layers = [], ctx, pointer, scr, camera, light, fps = 0, quality = [1,2],

	// ---- poly constructor ----

	Poly = function (parent, face) {

		this.parent = parent;

		this.ctx    = ctx;

		this.color  = face.fill || false;

		this.points = [];

		if (!face.img) {

			// ---- create points ----

			for (var i = 0; i < 4; i++) {

				this.points[i] = new ge1doot.transform3D.Point(

					parent.pc.x + (face.x[i] * parent.normalZ) + (face.z[i] * parent.normalX),

					parent.pc.y +  face.y[i],

					parent.pc.z + (face.x[i] * parent.normalX) + (-face.z[i] * parent.normalZ)

				);

			}

			this.points[3].next = false;

		}

	},

	// ---- diapo constructor ----

	Diapo = function (path, img, structure) {

		// ---- create image ----

		this.img = new ge1doot.transform3D.Image(

			this, path + img.img, 1, {

				isLoaded: function(img) {

					img.parent.isLoaded = true;

					img.parent.loaded(img);

				}

			}

		);

		this.visible  = false;

		this.normalX  = img.nx;

		this.normalZ  = img.nz;

		// ---- point center ----

		this.pc = new ge1doot.transform3D.Point(img.x, img.y, img.z);

		// ---- target positions ----

		this.tx = img.x + (img.nx * Math.sqrt(camera.focalLength) * 20);

		this.tz = img.z - (img.nz * Math.sqrt(camera.focalLength) * 20);

		// ---- create polygons ----

		this.poly = [];

		for (var i = -1, p; p = structure[++i];) {

			layers[i] = (p.img === true ? 1 : 2);

			this.poly.push(

				new Poly(this, p)

			);

		}

	},

	// ---- init section ----

	init = function (json) {

		// draw poly primitive

		Poly.prototype.drawPoly = ge1doot.transform3D.drawPoly;

		// ---- init screen ----

		scr = new ge1doot.Screen({

			container: "canvas"

		});

		ctx = scr.ctx;

		scr.resize();

		// ---- init pointer ----

		pointer = new ge1doot.Pointer({

			tap: function () {

				if (camera.over) {

					if (camera.over === camera.target.elem) {

						// ---- return to the center ----

						camera.target.x = 0;

						camera.target.z = 0;

						camera.target.elem = false;

					} else {

						// ---- goto diapo ----

						camera.target.elem = camera.over;

						camera.target.x = camera.over.tx;

						camera.target.z = camera.over.tz;

						// ---- adapt tesselation level to distance ----

						for (var i = 0, d; d = diapo[i++];) {

							var dx = camera.target.x - d.pc.x;

							var dz = camera.target.z - d.pc.z;

							var dist = Math.sqrt(dx * dx + dz * dz);

							var lev = (dist > 1500) ? quality[0] : quality[1];

							d.img.setLevel(lev);

						}

					}

				}

			}

		});

		// ---- init camera ----

		camera = new ge1doot.transform3D.Camera({

			focalLength: Math.sqrt(scr.width) * 10,

			easeTranslation: 0.025,

			easeRotation: 0.06,

			disableRz: true

		}, {

			move: function () {

				this.over = false;

				// ---- rotation ----

				if (pointer.isDraging) {

					this.target.elem = false;

					this.target.ry = -pointer.Xi * 0.01;

					this.target.rx = (pointer.Y - scr.height * 0.5) / (scr.height * 0.5);

				} else {

					if (this.target.elem) {

						this.target.ry = Math.atan2(

							this.target.elem.pc.x - this.x,

							this.target.elem.pc.z - this.z

						);

					}

				}

				this.target.rx *= 0.9;

			}

		});

		camera.z  = -10000;

		camera.py = 0;

		// ---- create images ----

		for (var i = 0, img; img = json.imgdata[i++];) {

			diapo.push(

				new Diapo(

					json.options.imagesPath, 

					img, 

					json.structure

				)

			);

		}	

		// ---- start engine ---- >>>

		setInterval(function() {

			quality = (fps > 50) ? [2,3] : [1,2];

			fps = 0;

		}, 1000);

		run();

	},

	// ---- main loop ----

	run = function () {

		// ---- clear screen ----

		ctx.clearRect(0, 0, scr.width, scr.height);

		// ---- camera ----

		camera.move();

		// ---- draw layers ----

		for (var k = -1, l; l = layers[++k];) {

			light = false;

			for (var i = 0, d; d = diapo[i++];) {

				(l === 1 && d.draw()) || 

				(d.visible && d.poly[k].draw());

			}

		}

		// ---- cursor ----

		if (camera.over && !pointer.isDraging) {

			scr.setCursor("pointer");

		} else {

			scr.setCursor("move");

		}

		// ---- loop ----

		fps++;

		requestAnimFrame(run);

	};

	/* ==== prototypes ==== */

	Poly.prototype.draw = function () {

		// ---- color light ----

		var c = this.color;

		if (c.light || !light) {

			var s = c.light ? this.parent.light : 1;

			// ---- rgba color ----

			light = "rgba(" + 

				Math.round(c.r * s) + "," +

				Math.round(c.g * s) + "," + 

				Math.round(c.b * s) + "," + (c.a || 1) + ")";

			ctx.fillStyle = light;

		}

		// ---- paint poly ----

		if (!c.light || this.parent.light < 1) {

			// ---- projection ----

			for (

				var i = 0; 

				this.points[i++].projection();

			);

			this.drawPoly();

			ctx.fill();

		}

	}

	/* ==== image onload ==== */

	Diapo.prototype.loaded = function (img) {

		// ---- create points ----

		var d = [-1,1,1,-1,1,1,-1,-1];

		var w = img.texture.width  * 0.5;

		var h = img.texture.height * 0.5;

		for (var i = 0; i < 4; i++) {

			img.points[i] = new ge1doot.transform3D.Point(

				this.pc.x + (w * this.normalZ * d[i]),

				this.pc.y + (h * d[i + 4]),

				this.pc.z + (w * this.normalX * d[i])

			);

		}

	}

	/* ==== images draw ==== */

	Diapo.prototype.draw = function () {

		// ---- visibility ----

		this.pc.projection();

		if (this.pc.Z > -(camera.focalLength >> 1) && this.img.transform3D(true)) {

			// ---- light ----

			this.light = 0.5 + Math.abs(this.normalZ * camera.cosY - this.normalX * camera.sinY) * 0.6;

			// ---- draw image ----

			this.visible = true;

			this.img.draw();

			// ---- test pointer inside ----

			if (pointer.hasMoved || pointer.isDown) {

				if (

					this.img.isPointerInside(

						pointer.X,

						pointer.Y

					)

				) camera.over = this;

			}

		} else this.visible = false;

		return true;

	}

	return {

		// --- load data ----

		load : function (data) {

			window.addEventListener('load', function () {

				ge1doot.loadJS(

					"/staticfile/js/imageTransform3D.js",

					init, data

				);

			}, false);

		}

	}

})().load({

	imgdata:[

		// north

		{img:'/images/1.jpg', x:-1000, y:0, z:1500, nx:0, nz:1},

		{img:'/images/2.jpg', x:0,     y:0, z:1500, nx:0, nz:1},

		{img:'/images/3.jpg', x:1000,  y:0, z:1500, nx:0, nz:1},

		// east

		{img:'/images/4.jpg', x:1500,  y:0, z:1000, nx:-1, nz:0},

		{img:'/images/5.jpg', x:1500,  y:0, z:0, nx:-1, nz:0},

		{img:'/images/6.jpg', x:1500,  y:0, z:-1000, nx:-1, nz:0},

		// south

		{img:'images/7.jpg', x:1000,  y:0, z:-1500, nx:0, nz:-1},

		{img:'images/8.jpg', x:0,     y:0, z:-1500, nx:0, nz:-1},

		{img:'images/9.jpg', x:-1000, y:0, z:-1500, nx:0, nz:-1},

		// west

		{img:'images/10.jpg', x:-1500, y:0, z:-1000, nx:1, nz:0},

		{img:'images/11.jpg', x:-1500, y:0, z:0, nx:1, nz:0},

		{img:'images/12.jpg', x:-1500, y:0, z:1000, nx:1, nz:0}

	],

	structure:[

		{

			// wall

			fill: {r:255, g:255, b:255, light:1},

			x: [-1001,-490,-490,-1001],

			z: [-500,-500,-500,-500],

			y: [500,500,-500,-500]

		},{

			// wall

			fill: {r:255, g:255, b:255, light:1},

			x: [-501,2,2,-500],

			z: [-500,-500,-500,-500],

			y: [500,500,-500,-500]

		},{

			// wall

			fill: {r:255, g:255, b:255, light:1},

			x: [0,502,502,0],

			z: [-500,-500,-500,-500],

			y: [500,500,-500,-500]

		},{

			// wall

			fill: {r:255, g:255, b:255, light:1},

			x: [490,1002,1002,490],

			z: [-500,-500,-500,-500],

			y: [500,500,-500,-500]

		},{

			// shadow

			fill: {r:0, g:0, b:0, a:0.2},

			x: [-420,420,420,-420],

			z: [-500,-500,-500,-500],

			y: [150, 150,-320,-320]

		},{

			// shadow

			fill: {r:0, g:0, b:0, a:0.2},

			x: [-20,20,20,-20],

			z: [-500,-500,-500,-500],

			y: [250, 250,150,150]

		},{

			// shadow

			fill: {r:0, g:0, b:0, a:0.2},

			x: [-20,20,20,-20],

			z: [-500,-500,-500,-500],

			y: [-320, -320,-500,-500]

		},{

			// shadow

			fill: {r:0, g:0, b:0, a:0.2},

			x: [-20,20,10,-10],

			z: [-500,-500,-100,-100],

			y: [-500, -500,-500,-500]

		},{

			// base

			fill: {r:32, g:32, b:32},

			x: [-50,50,50,-50],

			z: [-150,-150,-50,-50],

			y: [-500,-500,-500,-500]

		},{

			// support

			fill: {r:16, g:16, b:16},

			x: [-10,10,10,-10],

			z: [-100,-100,-100,-100],

			y: [300,300,-500,-500]

		},{

			// frame

			fill: {r:255, g:255, b:255},

			x: [-320,-320,-320,-320],

			z: [0,-20,-20,0],

			y: [-190,-190,190,190]

		},{

			// frame

			fill: {r:255, g:255, b:255},

			x: [320,320,320,320],

			z: [0,-20,-20,0],

			y: [-190,-190,190,190]

		},

		{img:true},

		{

			// ceilingLight

			fill: {r:255, g:128, b:0},

			x: [-50,50,50,-50],

			z: [450,450,550,550],

			y: [500,500,500,500]

		},{

			// groundLight

			fill: {r:255, g:128, b:0},

			x: [-50,50,50,-50],

			z: [450,450,550,550],

			y: [-500,-500,-500,-500]

		}

	],

	options:{

		imagesPath: ""

	}

});

</script>
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
		<div id="inshow">
			<canvas id="canvas">你的浏览器不支持HTML5画布技术，请使用谷歌浏览器。</canvas>
		</div>
	</div>
</body>

</html>