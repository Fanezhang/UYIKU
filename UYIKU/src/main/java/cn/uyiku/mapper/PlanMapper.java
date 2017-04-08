package cn.uyiku.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.uyiku.pojo.Plan;

public interface PlanMapper {
	/**查询所有的方案
	 * @return 返回所有搭配方案
	 */
	public List<Plan> findAllPlan();
	
	/**按季节查询方案----------------------------暂时没用到,用了findOnePlanById方法
	 * @param season  传入的季节
	 * @return 所有符合季节的搭配方案
	 */
	public List<Plan> findAllPlanBySeason(String season);
	
	
	/**
	 * 查询符合要求的close对象-----------------------返回为plan对象,但sql查到的包含cloth对象.前端只要plan对象的话,可以简化sql语句
	 * @param style 传入的风格参数
	 * @param season 传入的季节参数
	 * @param userId 传入的用户id
	 * @param id 套装id
	 * @return 返回 plan对象
	 */
	public List<Plan> findOnePlanById(@Param("style") String style, @Param("season") String season,@Param("userId")String userId, 
			@Param("id")String id );
	
	/** 保存一个plan方案
	 * @param plan 传入需要保存的Plan对象
	 */
	public void savePlan(Plan plan);
	
	/**对Plan名字的关键字 进行模糊查询
	 * @param word 模糊查找关键字
	 * @return 符合要求的Plan对象集合
	 */
	public List<Plan> findLike(@Param("word") String word, @Param("userId")String userId);
	
	/**
	 * @param plan 需要更新的Plan对象
	 */
	public void update(Plan plan);
	
	/**
	 * 在plan表中删除传入的Plan对象
	 * @param plan 待删除的对象
	 */
	public void delete(String id);
	
	/**
	 * 搜索符合标签内容的Plan对象
	 * @param style 方案风格
	 * @param season 方案季节
	 */
	public List<Plan> findPlanByTag(@Param("style") String style, @Param("season") String season,@Param("userId")String userId );
}
