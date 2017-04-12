package cn.uyiku.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	//断点续爬，加载数据库数据
	public Map<String,String> findAllTitles(){
		Map<String,String> map=new HashMap<String, String>(); 
		List<String> dataList = itemMapper.findAllTitles();
		if(!dataList.isEmpty()){
			for (String string : dataList) {
				map.put(string, "1");
			}
		}
		return map;
	}
}
