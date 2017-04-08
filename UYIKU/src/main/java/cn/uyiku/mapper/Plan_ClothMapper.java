package cn.uyiku.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.uyiku.pojo.Cloth;

public interface Plan_ClothMapper {
	
	/**查询符合套装的所有衣物的id集合
	 * @param planId 方案Id
	 * @return 方案内的单品集合
	 */
	public List<String> findClothByPid(String planId);
	
	/**
	 * 关联表内添加关联
	 * 使用注解将多值传递封装
	 * @param planId 方案的id
	 * @param cId 单品id
	 */
	public void save(@Param("planId") String planId, @Param("id") String id);
	
	/**
	 * 删除表内关联
	 * @param p_id 方案的p_id
	 */
	public void delete( String p_id);
}
