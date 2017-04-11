package cn.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.mapper.ItemMapper;
import cn.pojo.Item;

@Service
public class ItemServiceImpl {
	@Resource
	private ItemMapper itemMapper;
	public void save(Item item){
		itemMapper.save(item);
	}
}
