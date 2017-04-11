package cn.uyiku.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.uyiku.mapper.ItemMapper;
import cn.uyiku.pojo.Item;

@Service
public class ItemService {
	@Resource
	private ItemMapper itemMapper;
	
	public void save(Item item){
		itemMapper.save(item);
	}
}
