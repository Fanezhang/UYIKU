 package cn.uyiku.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.uyiku.pojo.User;
import cn.uyiku.service.UserService;

@Controller
public class UserController {
	
	@Resource
	private UserService userService;

	
	@RequestMapping("tosuitList.action")
	public String suits(){
		return "planelist";
	}
	/*@RequestMapping("/tologin.action")
	public String tologin() {
		return "login"; 
	}
	
	@RequestMapping("/tolight.action")
	public String tolight() {
		return "light"; 
	}
	@RequestMapping("/login.action")
	public String login(String userName,String userPassword,Model model) {
		User user = null;
		user = userService.findOne(userName,userPassword);
		if(user!=null) {
			model.addAttribute("userName", userName);
			if(user.getUrl()!=null) {
				model.addAttribute("user", user);
				return "garde";
			}
			return "welcome"; //登录完了之后跳转到上传图像界面
		}
		model.addAttribute("msg", "用户名或者密码错误");
		return "login";
	}
	
	@RequestMapping("/regist.action")
	public String regist(User user,Model model) {
		
		String userId = UUID.randomUUID().toString();
		user.setUserId(userId);
		userService.save(user);
		
		model.addAttribute("msgss", "注册成功，请登录！");
		
		return "login";
	}
	
	//处理用户上传头像
	@RequestMapping("/userimg.action")
	public String userImg(MultipartFile file,String userId,Model model) throws IOException {
		String userUrl1 = "C:\\tts9\\tts9\\eclipse3workspace\\uyk01\\src\\main\\webapp\\images\\"+file.getOriginalFilename();
		//需要将文件传入到指定的文件夹当中
		FileUtils.writeByteArrayToFile(new File(userUrl1), file.getBytes());
		String userUrl = "images/"+file.getOriginalFilename();
		userService.saveHead(userId,userUrl);
		User user = userService.findUserById(userId);//新增的findUserById方法
		model.addAttribute("user", user);
		return "garde"; 
		
	}*/
	
	
	
	
/*	@RequestMapping("/toregist.action")
	public String toLogin() {
		return "/regist"; //跳转到用户的注册页面
	}
	
	//这是一个用户登录的方法 后期需要用shiro做保密工作
	@RequestMapping("/regist.action")
	public String save(String userName,String userPassword,Model model,MultipartFile file) {
		User user = new User();
		String uId = UUID.randomUUID().toString();
		user.setUserId(uId);
		user.setUsername(userName);
		user.setPassword(userPassword);
		user.setUrl("图片服务器域名/"+uId+".jpg");
		user.setCreateTime(new Date());
		user.setLastUpdateTime(new Date());
		//TODO
		//这里有保存file到图片服务器的功能
		userService.save(user);
		
		return "/toaddhead";
	}*/
	
	@RequestMapping("addhead.action")
	public String userImg(MultipartFile file,String userId,HttpServletResponse response) throws IOException, InterruptedException {
		String userUrl1 = "C:\\images\\"+userId+".jpg";
		//需要将文件传入到指定的文件夹当中
		FileUtils.writeByteArrayToFile(new File(userUrl1), file.getBytes());
		//读取配置文件中的Apache图片服务器的ip地址
		Properties pro=new Properties();
		pro.load(this.getClass().getClassLoader().getResourceAsStream("apacheIpProperties.properties"));
		String ip = pro.getProperty("ip");
		String userUrl = ip+"/images/"+userId+".jpg";
		userService.saveHead(userId,userUrl);
		Cookie cookie=new Cookie("userUrl",userUrl);
		cookie.setMaxAge(3600*24*30);
		response.addCookie(cookie);
//		Thread.sleep(1000);		//延迟跳转
		return "garde"; 
		
	}
	@RequestMapping("skipAddHead")
	public String skipAddHead(String userId,HttpServletResponse response) throws IOException{
		//读取配置文件中的Apache图片服务器的ip地址
		Properties pro=new Properties();
		pro.load(this.getClass().getClassLoader().getResourceAsStream("apacheIpProperties.properties"));
		String ip = pro.getProperty("ip");
		userService.saveHead(userId, ip+"/images/default.jpg");
		Cookie Cookie=new Cookie("userUrl",ip+"/images/default.jpg");
		Cookie.setMaxAge(3600*24*30);
		response.addCookie(Cookie);
		return "garde";
	}
	/*public String addHead(String userId,MultipartFile file){
		String imgUrl = "图片服务器域名/"+userId+".jpg";
		//TODO
		//这里有保存file到图片服务器的功能
		userService.saveHead(userId,imgUrl);
		//返回全部单品
		return null;
	}*/
	
}
