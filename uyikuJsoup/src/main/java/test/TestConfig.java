package test;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestConfig {
	@Autowired
	private Environment env;
	@Value("${ip}")
	private String ip;
	@RequestMapping("/haha")
	public String haha(){
		return env.getProperty("spring.mvc.view.prefix")+"</br>"+env.getProperty("spring.mvc.view.suffix")+"</br>"+ip;
	}
	@Bean
	public MyBean initMyBean(){
		return new MyBean("this is my bean");
	}
}
class MyBean{
	private String aa;
	public MyBean(String aa) {
		this.aa=aa;
	}
	public String getAa() {
		return aa;
	}
	public void setAa(String aa) {
		this.aa = aa;
	}
	
}