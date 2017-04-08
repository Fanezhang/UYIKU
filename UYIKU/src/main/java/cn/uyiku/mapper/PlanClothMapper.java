package cn.uyiku.mapper;

public interface PlanClothMapper {
	/**
	 * 根据衣物id删除关联表的记录
	 * @param clothId
	 */
	public void deleteClothById(String[] cId);

}
