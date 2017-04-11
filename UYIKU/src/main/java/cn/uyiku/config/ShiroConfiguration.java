package cn.uyiku.config;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import cn.uyiku.shiro.AuthCredential;
import cn.uyiku.shiro.AuthRealm;

@Configuration
public class ShiroConfiguration {
	
	@Bean
	public SecurityManager securityManager() {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		//设置realm
		securityManager.setRealm(shiroRealm());
		return securityManager;
	}
	
	@Bean
	public AuthRealm shiroRealm() {
		AuthRealm authRealm = new AuthRealm();
		authRealm.setCredentialsMatcher(credentialsMatcher());
		return authRealm;
	}

    /**
     * 凭证匹配器
     * （由于我们的密码校验交给Shiro的SimpleAuthenticationInfo进行处理了
     *  所以我们需要修改下doGetAuthenticationInfo中的代码;
     * ）
     * @return
     */
    @Bean
    public CredentialsMatcher credentialsMatcher(){
        CredentialsMatcher credentialsMatcher = new AuthCredential();
        return credentialsMatcher;
    }
    
    @Bean
    public ShiroFilterFactoryBean shirFilter(SecurityManager securityManager){

        ShiroFilterFactoryBean shiroFilterFactoryBean  = new ShiroFilterFactoryBean();
        // 必须设置 SecurityManager
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        // 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
        shiroFilterFactoryBean.setLoginUrl("/index.jsp");
        
        //拦截器.
        Map<String,String> filterChainDefinitionMap = new LinkedHashMap<String,String>();
        //<!-- 过滤链定义，从上向下顺序执行，一般将 /**放在最为下边 -->
        // 这里存在一个短路机制，即最先匹配原则如：/user/**=anon，/user/aa=authc 永远不会执行
        //<!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
        //验证码可以匿名访问
        filterChainDefinitionMap.put("/tologin.action", "anon");
        filterChainDefinitionMap.put("/login.action", "anon");
        filterChainDefinitionMap.put("/checkUsername.action", "anon");
        filterChainDefinitionMap.put("/regist.action", "anon");
        filterChainDefinitionMap.put("/tolight.action", "anon");
        filterChainDefinitionMap.put("/staticfile/**", "anon");
        
        filterChainDefinitionMap.put("/**", "authc");
        
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }
}
