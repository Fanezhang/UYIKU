package cn.mapper;

import org.apache.ibatis.annotations.Mapper;

import cn.pojo.Item;

@Mapper
public interface ItemMapper {
	public void save(Item item);
}
