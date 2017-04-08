package cn.uyiku.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.uyiku.pojo.Cloth;

public interface ClothMapper {

	public List<Cloth> findAllCloth(String id);

	public Cloth findOneClothById(String id);

	public void updateCloth(Cloth cloth);

	public List<Cloth> findClothByTag(@Param("style") String style,  @Param("season") String season, 
			@Param("category") String category, @Param("id")String id);

	public List<Cloth> findClothListByPId(String pid);
	
	
	/**
	 * 根据衣物id删除衣物表的记录
	 * @param cId	衣物id的数组，
	 */
	public void deleteClothById(String[] id);
	/**
	 * 根据关键字模糊搜索
	 * @param word	关键字
	 * @return	衣物对象的集合
	 */
	public List<Cloth> findLike(@Param("word") String word ,  @Param("userId")String userId);
	/**
	 * 把新添加的衣物保存到数据库
	 * @param cloth	衣物对象
	 * @param uId	用户id
	 */
	public void saveCloth(@Param("cloth") Cloth cloth,@Param("userId") String userId);

	public List<Cloth> findAllClothList(String uId);

}
 