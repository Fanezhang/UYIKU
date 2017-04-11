package cn.uyiku.mapper;

import org.apache.ibatis.annotations.Mapper;

public interface PlanClothMapper {
	/**
	 * 根据衣物id删除关联表的记录
	 * @param clothId
	 */
	public void deleteClothById(String[] cId);

}
