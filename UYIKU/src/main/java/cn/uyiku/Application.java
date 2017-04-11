package cn.uyiku;

import javax.sql.DataSource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication
public class Application {

    // 创建事务管理器
	//其中 dataSource 框架会自动为我们注入
    @Bean(name = "tm")
    public PlatformTransactionManager transactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
    
//    @Bean 
//    public MultipartConfigElement multipartConfigElement() { 
//        MultipartConfigFactory factory = new MultipartConfigFactory();
//        //// 设置文件大小限制 ,超了，页面会抛出异常信息，这时候就需要进行异常信息的处理了;
//        factory.setMaxFileSize("10MB");
//        /// 设置总上传数据总大小  
//        factory.setMaxRequestSize("3MB"); 
//        return factory.createMultipartConfig();
//    }
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
	
}
