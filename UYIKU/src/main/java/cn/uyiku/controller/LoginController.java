package cn.uyiku.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.jdbc.StringUtils;

import cn.uyiku.pojo.User;
import cn.uyiku.service.UserService;

@Controller
public class LoginController extends BaseController {

	@Resource
	private UserService userService;

	@RequestMapping("/tolight.action")
	public String toLight() {

		return "/light";
	}

	@RequestMapping("jump.action")
	public String jump() {
		return "garde2";
	}

	// 跳转到登陆页面
	@RequestMapping("/tologin.action")
	public String tologin(HttpServletResponse res) {
		Cookie cookie = new Cookie("userUrl", null);
		cookie.setMaxAge(0);
		res.addCookie(cookie);
		return "/login";
	}

	@RequestMapping("/regist.action")
	public String regist(User user, Model model) {
		System.out.println(user.getName() + "");
		String userId = UUID.randomUUID().toString();
		user.setUserId(userId);
		userService.save(user);

		model.addAttribute("msg", "注册成功，请登录！");

		return "login";
	}

	@RequestMapping("login.action")
	public String login(String username, String password, Model model, HttpServletResponse response) {
		if (StringUtils.isNullOrEmpty(username) || StringUtils.isNullOrEmpty(password)) {
			// 输入的数据为空
			model.addAttribute("msg", "用户名或密码错误");

			return "/login";
		}
		// 输入的数据为空
		// 创建token
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		// 2 创建subject对象,其为一个用户
		Subject subject = SecurityUtils.getSubject();
		// 通过subject进行登录, 该方法会调用shrio内部的校验, 如果校验不通过则会抛出异常信息,
		try {
			subject.login(token);
			// System.out.println(token);
			User user = (User) subject.getPrincipal();
			subject.getSession().setAttribute("userSession", user);
			/*
			 * 需要前端调用cookie,获取用户id,添加到隐藏域
			 */
			Cookie cookie = new Cookie("userId", user.getUserId());
			// System.out.println(cookie.getValue());
			cookie.setMaxAge(3600 * 24 * 30);
			response.addCookie(cookie);
			if (user.getUrl() == null) {
				/*
				 * 如果登录之后没有头像,跳转到welcome添加图像 如果添加了正确的图像 保存一个头像的urlCookie,在导航页面使用
				 * 如果跳过,则使用一个新的方法skipaddhead
				 * 在其中把默认的Url存到数据库中,并保存一个默认头像的UrlCookie
				 */
				return "/welcome";
			}
			// 这里路径需要拼接
			Properties pro = new Properties();
			pro.load(this.getClass().getClassLoader().getResourceAsStream("apacheIpProperties.properties"));
			String ip = pro.getProperty("ip");
			Cookie urlCookie = new Cookie("userUrl", ip + "/" + user.getUserId() + ".jpg");
			urlCookie.setMaxAge(3600 * 24 * 30);
			response.addCookie(urlCookie);
			return "/garde";
		} catch (Exception e) {
			model.addAttribute("msg", "用户名或密码错误");
			return "/login";
		}
	}
	// TODO ajax校验用户名是否存在
	/*
	 * @RequestMapping("checkUsername.action") public String
	 * checkUsername(String username,Model model,HttpServletResponse response)
	 * throws IOException{
	 * System.out.println("-----------------------------------------");
	 * System.out.println(username); try{ User user =
	 * userService.findUserByUsername(username); System.out.println(user);
	 * if(user!=null){ model.addAttribute("msg","用户名已存在"); } }catch(Exception
	 * e){ e.printStackTrace();
	 * System.out.println("1111111111111111111111111111111111");
	 * response.getWriter().write("用户名可以使用");
	 * System.out.println("2222222222222222222222222222222222");
	 * model.addAttribute("msg","用户名可以使用");
	 * System.out.println("3333333333333333333333333333333333"); } return
	 * "/login"; }
	 */
}
