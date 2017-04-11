
package cn.uyiku.shiro;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import cn.uyiku.pojo.User;
import cn.uyiku.service.UserService;

public class AuthRealm extends AuthorizingRealm{
	@Resource
	private UserService userService;
	
	//该方法是用来做认证模块的
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		/*
		 * 该Realm是为shiro安全管理器,通过用来认证的realm
		 * 需要提供正确的用户名以及密码, 在该处通过获取到的用户名与密码在数据库中找对应的数据,之后移交安全管理器进行处理
		 * 值需要通过用户名查找到密码返回就可以了
		 */
		//强制转化为username的token
		UsernamePasswordToken loginToken = (UsernamePasswordToken) token;
		String username = loginToken.getUsername();
		// 通过用户名获取用户的真实信息
		User user = userService.findUserByUsername(username);
		/*
		 * 参数含义 第一个,真实用户的对象
		 * 第二个, 校验用户密码, 真实的用户密码
		 * 第三个, 指定当前realm的名称
		 */
		AuthenticationInfo info  = new SimpleAuthenticationInfo(user, user.getPassword(), this.getName());
		
		return info;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		return null;
	}
	
	





	
	
	
}
