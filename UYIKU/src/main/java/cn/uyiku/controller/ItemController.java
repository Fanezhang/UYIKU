package cn.uyiku.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.uyiku.pojo.Item;
import cn.uyiku.service.ItemService;
@Controller
public class ItemController {
	@Resource
	private ItemService itemService;
	
	@RequestMapping("/tostar.action")
	public String toStar2(Model model){
		List<Item> itemsList = itemService.selectItems();
		model.addAttribute(itemsList);
		System.out.println("%%%%%%%%%%%%%%%%%%");
		return "star";
	}

}
