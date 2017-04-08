package cn.uyiku.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import cn.uyiku.mapper.PlanMapper;
import cn.uyiku.mapper.Plan_ClothMapper;
import cn.uyiku.pojo.Plan;

@Service
public class PlanServiceImpl implements PlanService{
	
	
	//用UUID生成
	String userId="1";

	@Resource
	private PlanMapper planMapper;
	@Resource
	private Plan_ClothMapper plan_ClothMapper;
	


	@Override
	public List<Plan> findAllPlanBySeason(String season) {
		return planMapper.findAllPlanBySeason(season);
	}

	@Override
	public List<Plan> findOnePlanById( String style, String season,String userId,String id) {
		
		return planMapper.findOnePlanById(style, season, userId, id);
	}

	@Override
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
	
	@Override
	public List<Plan> findLike(String word,String userId) {
		return planMapper.findLike(word,userId);
	}

	@Override
	public void delete(String id) {
		plan_ClothMapper.delete(id);
		planMapper.delete(id);
		
	}

	@Override
	public List<Plan> findPlanByTag(String style, String season, String userId) {
		return planMapper.findPlanByTag(style,season,userId);
	
	}

	@Override
	public void update(Plan plan, List<String> cIds) {
		
		
	}



	
}
