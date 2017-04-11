package cn.test;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController2 {
	@RequestMapping("/")
	public String index(){
		return "index";
	}
	@RequestMapping("a/{num}")
	public void a(@PathVariable("num") String num,HttpServletResponse resp) throws IOException{
		resp.getWriter().write(num);
	}
	
}
