package cn.uyiku.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.uyiku.mapper.ItemMapper;
import cn.uyiku.pojo.Item;
@Service
public class ItemServiceImpl implements ItemService {
	@Resource
	private ItemMapper itemMapper;
	@Override
	public List<Item> selectItems() {
		return itemMapper.selectItems();
	}

}
