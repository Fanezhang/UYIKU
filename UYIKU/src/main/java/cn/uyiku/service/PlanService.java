package cn.uyiku.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.uyiku.mapper.PlanMapper;
import cn.uyiku.mapper.Plan_ClothMapper;
import cn.uyiku.pojo.Plan;

@Service
public class PlanService {
	
	
	//用UUID生成
	String userId="1";

	@Autowired
	private PlanMapper planMapper;
	@Autowired
	private Plan_ClothMapper plan_ClothMapper;
	
	
	public List<Plan> findAllPlanBySeason(String season) {
		return planMapper.findAllPlanBySeason(season);
	}


	public List<Plan> findOnePlanById( String style, String season,String userId,String id) {
		
		return planMapper.findOnePlanById(style, season, userId, id);
	}

	@Transactional(value="tm")
	public void save(Plan plan, String[] ids,String userId) {
		System.out.println("走到service层");
		//保存Plan对象到数据库Plan表
		planMapper.savePlan(plan);
		//保存方案及单品关系
		for (String id : ids) {
			plan_ClothMapper.save(plan.getId(), id);
		}
	}
	
/*	@Override
	public void update(Plan plan, List<String> cIds) {
		//更新Plan表中的对象
		planMapper.update(plan);
		//删除关联表中原有的Plan对象
		plan_ClothMapper.delete(plan.getId());
		//保存方案及单品关系
		plan_ClothMapper.save(plan.getId(), id);
	}*/
	

	public List<Plan> findLike(String word,String userId) {
		return planMapper.findLike(word,userId);
	}


	public void delete(String id) {
		plan_ClothMapper.delete(id);
		planMapper.delete(id);
		
	}

	@Transactional(value="tm")
	public List<Plan> findPlanByTag(String style, String season, String userId) {
		return planMapper.findPlanByTag(style,season,userId);
	
	}

	@Transactional(value="tm")
	public void update(Plan plan, List<String> cIds) {
		
		
	}



	
}
