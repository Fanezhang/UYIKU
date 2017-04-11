package cn.uyiku.mapper;

import org.apache.ibatis.annotations.Mapper;

import cn.uyiku.pojo.Item;

@Mapper
public interface ItemMapper {
	public void save(Item item);
}
