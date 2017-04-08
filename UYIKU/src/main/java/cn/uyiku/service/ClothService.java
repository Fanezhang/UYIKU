package cn.uyiku.service;

import java.util.List;

import cn.uyiku.pojo.Cloth;

public interface ClothService {

	 List<Cloth> findClothList(String style ,String userId);

	Cloth findOneClothById(String cId);

	void updateCloth(Cloth cloth);

	
	//--------------------------------
	List<Cloth> findClothByTag(String style, String season, String category,String userId);
	List<Cloth> findClothListByPId(String Pid);
	
	/**
	 * 根据衣物id删除衣物
	 * @param clothId
	 */
	public void deleteClothById(String[] clothId);
	/**
	 * 根据关键字进行模糊搜索
	 * @param word 关键字
	 * @return 衣物对象的集合
	 */
	public List<Cloth> findLike(String word, String userId);
	/**
	 * 把新添加的衣物保存到数据库
	 * @param cloth	衣物对象
	 * @param uId	用户id
	 */

	void saveCloth(Cloth cloth,String userId);

	List<Cloth> findAllClothList(String userId);

	
	

}
