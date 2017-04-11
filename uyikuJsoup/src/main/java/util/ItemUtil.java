package util;

import java.util.Date;

import pojo.Item;

public class ItemUtil {
	/**
	 * 把爬到的数据封装成对象
	 * @param ItemNum		主键 第几条数据
	 * @param itemUrl		详情页链接
	 * @param title			商品标题
	 * @param saleNum		销量
	 * @param seasonAndTime	季节和时间
	 * @param brand			品牌
	 * @param category		类别
	 * @param imgUrl		图片链接
	 * @return
	 */
	public static Item StringToItem(int ItemNum,String itemUrl,String title,int saleNum,String seasonAndTime,String brand,String category,String imgUrl){
		Item item=new Item();
		item.setId(ItemNum);
		item.setUrl(itemUrl);
		item.setTitle(title);
		item.setDnum(saleNum);
		item.setCtime(new Date());
		item.setImgUrl(imgUrl);
		String season=seasonAndTime.substring(0,4);
		item.setSeason(season);
		item.setBrand(brand);
		item.setCategory(category);
		return item;
	}
}
