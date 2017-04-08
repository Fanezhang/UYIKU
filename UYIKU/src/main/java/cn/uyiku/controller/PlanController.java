package cn.uyiku.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.uyiku.mapper.Plan_ClothMapper;
import cn.uyiku.pojo.Cloth;
import cn.uyiku.pojo.Plan;
import cn.uyiku.service.ClothService;
import cn.uyiku.service.PlanService;
import cn.uyiku.tool.SeasonTool;


@Controller
@RequestMapping("/plan/")
public class PlanController extends BaseController {
	
	@Resource
	private PlanService planService;

	@Resource
	private ClothService clothService;
	@Resource
	private Plan_ClothMapper plan_ClothMapper;
	
	String season =SeasonTool.getSeason();
	// 这个地方待定
	/*
	 * @RequestMapping("list") public String findAllPlan(Model model) {
	 * List<Plan> planList = planService.findAllPlan();
	 * model.addAttribute("planList", planList); return "plan/planList"; }
	 */

	@RequestMapping("list")
	public String findAllPlan(String style,String userId, Model model) {
		
		List<Plan> planList = planService.findPlanByTag(style, season,userId);
		int workNum = 0;
		int relaxNum = 0;
		int sportNum = 0;

		for (Plan plan : planList) {
			String planStyle = plan.getStyle();
			if (planStyle.equals("正式")) {
				workNum++;
			} else if (planStyle.equals("休闲")) {
				relaxNum++;
			} else {
				sportNum++;
			}
		}
		for (Plan plan : planList) {
			System.out.println(plan);
		}

		model.addAttribute("workNum", workNum);
		model.addAttribute("relaxNum", relaxNum);
		model.addAttribute("sportNum", sportNum);
		model.addAttribute("planList", planList);

		return "redirect:/plan/list";
	}

	/**
	 * 根据一个衣服id来精确的查找衣服
	 */
	@RequestMapping("findoneplan")
	public String findOnePlan(Model model, String id) {

		// 这个地方返回的是一个list集合,在使用的时候只需要取第一个元素,在其对象上进行进行获取


		String style = null;
		String season = null;
		String userId = null;
		List<Plan> planList = planService.findOnePlanById(style, season, userId, id);

		model.addAttribute("planList", planList);

		return "";// 未定
	}


	
	@RequestMapping("toupdate")
	public String toUpdate(Model model, String id) {
		String style = null;
		String season = null;
		String userId = null;
		List<Plan> planList = planService.findOnePlanById(style, season, userId, id);
		Plan plan = planList.get(1);
		model.addAttribute("plan", plan);
		/*
		 * 暂时不知道这个方法是否能够正确的运行
		 */
		List<Cloth> clothes = clothService.findClothListByPId(id);
		model.addAttribute("clothes", clothes);
		return "plan/updatePlan";
	}

	
	
	/*
	 * save方法, 可能存在问题,需要进一步的进行处理
	 */
	@RequestMapping("update")
	public String save(Plan plan, String[] id) {
		String userId= plan.getUserId();
		plan.setLastUpdateTime(new Date());
		planService.save(plan, id,userId);
		return "redirect:/plan/list";
	}

	@RequestMapping("plancount")
	public String planCount(Model model,String userId) {
		String style = null;
		String season = null;
		String id= null;
		List<Plan> planList = planService.findOnePlanById(style, season, userId, id);
		int planNum = planList.size();
		System.out.println(planNum);
		model.addAttribute("planNum", planNum);
		return "plan/list";
	}

	@RequestMapping("PlanTag")
	public String findPlanByTag(String style, String season, Model model) {
		String userId= null;
		String id= null; 
		List<Plan> planList = planService.findOnePlanById(style, season, userId, id);
		int workNum = 0;
		int relaxNum = 0;
		int sportNum = 0;

		for (Plan plan : planList) {
			String planStyle = plan.getStyle();
			if (planStyle.equals("正式")) {
				workNum++;
			} else if (planStyle.equals("休闲")) {
				relaxNum++;
			} else {
				sportNum++;
			}
		}

		model.addAttribute("workNum", workNum);
		model.addAttribute("relaxNum", relaxNum);
		model.addAttribute("sportNum", sportNum);
		model.addAttribute("planList", planList);

		return "redirect:/plan/list";
	}

	@RequestMapping("tocreate")
	public String toCreate(String[] id ,Model model) {
		String defaultPlanImgUrl="套装默认的url";
		List<Cloth>clothList=new ArrayList<Cloth>();
		for (String cId : id) {
			Cloth cloth = clothService.findOneClothById(cId);
			clothList.add(cloth);
		}
	model.addAttribute("clothList", clothList);
	model.addAttribute("defaultPlanImgUrl",defaultPlanImgUrl);
	return "plan/creat";
	
	}
	@RequestMapping("create")
	public String create(Plan plan, String[] id, String userId,MultipartFile file) {
		String planId = UUID.randomUUID().toString();
		plan.setUserId(userId);
		plan.setId(planId);
		plan.setCreateTime(new Date());
		plan.setLastUpdateTime(new Date());
		//TODO
		//这里有保存file到图片服务器的功能
		planService.save(plan, id, userId);
		return "plan/list";
	}

	@RequestMapping("findlike")
	public String findLike(String key,String userId,Model model) {

		List<Plan> planList = planService.findLike(key,userId);
		model.addAllAttributes(planList);
		// 这个地方应该带到全新的页面, 不应该带到list页面,带过去的话会调用起里面的方法, 
		//显示的数据不是findlike查询到的数据
		return "redirect:/plan/findLike";
	}
	//delete的时候需要传过来的数据是plan的id
	@RequestMapping("delete")
	public String delete(String id) {
		planService.delete(id);
		return "redirect:/plan/list";
	}
}
