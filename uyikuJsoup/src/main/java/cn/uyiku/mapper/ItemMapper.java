package cn.uyiku.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.uyiku.pojo.Item;

@Mapper
public interface ItemMapper {
	public void save(Item item);
	public List<String> findAllTitles();
}
