package cn.uyiku.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testCountController {
	@RequestMapping("count.action")
	public String toCount(Model model){
		int clothNum=70;
		int planNum=12;
		int workNum = 10,relaxNum = 20,sportNum = 40,springAutumn = 15,summer = 25,winter = 30;
		int up = 10,down = 12,shoes=14,bag=16,ornament = 18;
		int planworkNum = 5,planrelaxNum = 4,plansportNum = 3,planspringAutumn = 2,plansummer = 7,planwinter = 3;
		model.addAttribute("clothNum",clothNum);
		model.addAttribute("planNum",planNum);
		model.addAttribute("workNum",workNum);//正式
		model.addAttribute("planworkNum",planworkNum);
		model.addAttribute("relaxNum",relaxNum);//休闲
		model.addAttribute("planrelaxNum",planrelaxNum);
		model.addAttribute("sportNum",sportNum);//运动
		model.addAttribute("plansportNum",plansportNum);
		model.addAttribute("springAutumn",springAutumn);//春秋
		model.addAttribute("planspringAutumn",planspringAutumn);
		model.addAttribute("summer",summer);//夏
		model.addAttribute("plansummer",plansummer);
		model.addAttribute("winter",winter);//冬
		model.addAttribute("planwinter",planwinter);
		model.addAttribute("up",up);//上衣
		model.addAttribute("down",down);//下衣
		model.addAttribute("shoes",shoes);//鞋
		model.addAttribute("bag",bag);//包
		model.addAttribute("ornament",ornament);//首饰
		return "clothCount";
	}
}
