package cn.uyiku.shiro;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

public class AuthCredential extends  SimpleCredentialsMatcher{
	/*
	 * 自定义的加密方法, 非必须写的, 
	 * (non-Javadoc)
	 * @see org.apache.shiro.authc.credential.SimpleCredentialsMatcher#doCredentialsMatch(org.apache.shiro.authc.AuthenticationToken, org.apache.shiro.authc.AuthenticationInfo)
	 */
	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		// 将用户的铭文进行加密, 需要获取用户名以及密码
		UsernamePasswordToken loginToken = (UsernamePasswordToken) token;
		String username = loginToken.getUsername();
		String password = String.valueOf(loginToken.getPassword());
		//通过加密算法获取到加密后的密码
//		password = MD5.getMd5Hash(username, password);
		// 将密文设置到token中
		loginToken.setPassword(password.toCharArray());
		
		return super.doCredentialsMatch(loginToken, info);
	}

}
