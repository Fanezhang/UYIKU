package cn.uyiku.controller;

import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogOutController {
	/**
	 * 用户注销
	 * @return
	 */
	@RequestMapping("/logout.action")
	public String logout(){
		Cookie cookie=new Cookie("userId","");
		cookie.setMaxAge(0);
		return "index";
	}
}
