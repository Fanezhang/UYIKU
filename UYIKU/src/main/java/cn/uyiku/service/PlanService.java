package cn.uyiku.service;

import java.util.List;

import cn.uyiku.pojo.Cloth;
import cn.uyiku.pojo.Plan;

public interface PlanService {



	/**按季节查询方案----------------------------暂时没用到,用了findOnePlanById方法
	 * @param season:
	 * @return 所有符合季节的搭配方案
	 */
	public List<Plan> findAllPlanBySeason(String season);
	
	/**
	 * 根据planId返回具体的一个Plan对象
	 * 需要ClothService.findCloseListById方法支持
	 * @param planId
	 * @return 一个搭配方案对象
	 */
	public List<Plan> findOnePlanById( String style, String season,String userId,String id) ;
	
	/**
	 * 保存一种搭配类型
	 * @param plan 保存传入的Plan对象
	 */
	public void save(Plan plan, String[] ids,String userId);
	
	/**
	 * 更新一个搭配类型
	 * @param plan 需要更新的Plan对象
	 */
	public void update(Plan plan,List<String> cIds);
	
	/**
	 * 对Plan名字的关键字 进行模糊查询
	 * @param word 
	 * @return 返回模糊查询的结果
	 */
	public List<Plan> findLike(String word,String userId);
	
	/**
	 * 删除指定的Plan id
	 * @param plan 删除的Plan
	 */
	public void delete(String id);
	
	/**
	 * 查找指定条件的套装
	 * @param style  传入的风格
	 * @param season  传入的季节
	 * @return
	 */
	public List<Plan> findPlanByTag(String style, String season,String userId);
}
