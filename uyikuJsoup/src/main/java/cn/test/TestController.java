package cn.test;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

//@SpringBootApplication
@RestController
public class TestController {
	@Autowired
	private MyBean myBean;
	@RequestMapping("hello")
	public void hello(HttpServletResponse resp) throws IOException{
		resp.getWriter().write("hello1"+"\n"+myBean.getAa());
	}
	@RequestMapping("/num/{num}")
	public String index(@PathVariable("num")int num){
		return num+"";
	}
	@RequestMapping("/index1")
	public ModelAndView index(){
		return new ModelAndView("index");
	}
//	public static void main(String[] args){
//		SpringApplication.run(TestController.class, args);
//	}
	@RequestMapping("hh")
	public String hh(){
		return "hh";
	}
	
}
