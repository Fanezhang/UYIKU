package cn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import cn.controller.StartController;

@EnableTransactionManagement
@SpringBootApplication
public class StartSpringBoot {
	public static void main(String[] args){
		SpringApplication.run(StartController.class, args);
	}
}
