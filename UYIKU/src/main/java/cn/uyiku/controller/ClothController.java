package cn.uyiku.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.io.FileUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.web.session.HttpServletSession;
import org.aspectj.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.uyiku.pojo.Cloth;
import cn.uyiku.service.ClothService;
import cn.uyiku.tool.SeasonTool;
import oracle.net.aso.s;

@Controller
public class ClothController {
	@Resource
	private ClothService clothService;
	
	String season =SeasonTool.getSeason();
	@RequestMapping("togarde.action")
	public String toGarde(){
		return "garde";
	}
	@RequestMapping("toclothUpList.action")
	public String up(Model model,String userId){
		List<Cloth> clothList = clothService.findClothByTag(null, null, "上衣", userId);
		System.out.println("clothList="+clothList);
		model.addAttribute("clothList",clothList);
		return "clothUpList";
	}
	
	//查询出衣物的列表
	@RequestMapping("list")
	public String toList(String style,Model model,String userId){
		//接收在service层处理好的季节符合的list
		List<Cloth>  clothList  = clothService.findClothList(style ,userId);

		int relaxNum=0 ;
		int	sportNum=0;
		int workNum = 0;
		
		for (Cloth cloth : clothList) {
			String clothStyle = cloth.getStyle();
			if(clothStyle.equals("休闲")){
				relaxNum++;
			}else if(clothStyle.equals("运动")){
				sportNum++;
			}else{
				workNum++;
			}
		}

		model.addAttribute("relaxNum", relaxNum);
		model.addAttribute("sportNum", sportNum);
		model.addAttribute("workNum", workNum);
		model.addAttribute("clothList", clothList);
		return "clothList";
	
		
	}
	//查找一件衣服根据id
	@RequestMapping("clothInfo.action")
	public String findOneCloth(String clothId,Model model){
		
		//Cloth cloth = clothService.findOneClothById(cId);
		Cloth cloth = clothService.findOneClothById(clothId);
	
		model.addAttribute("cloth", cloth);
		//转发页面暂时未定
		return "clothInfo";	
	}
	@RequestMapping("countCloth.action")
	public String toCount(Model model,String userId){
		List<Cloth> clothList = clothService.findAllClothList(userId);
		int clothNum=clothList.size();
		int workNum = 0,relaxNum = 0,sportNum = 0,springAutumn = 0,summer = 0,winter = 0,up = 0,down = 0,ornament = 0;//正式、休闲、运动、春秋、夏、冬	、上衣、下衣、饰品的数量
		int shoes=0,bag=0;
		
		int planNum=12;
		int planworkNum = 5,planrelaxNum = 4,plansportNum = 3,planspringAutumn = 2,plansummer = 7,planwinter = 3;
		
		//分类统计
				for (Cloth cloth : clothList) {
					String style = cloth.getStyle();
					String season = cloth.getSeason();
					String category = cloth.getCategory();
					/*
					 * 统计风格
					 */
					if("正式".equals(style)){
						workNum++;
					}else if("休闲".equals(style)){
						relaxNum++;
					}else if("运动".equals(style)){
						sportNum++;
					}
					/*
					 * 统计季节
					 */
					if("春秋".equals(season)){
						springAutumn++;
					}else if("夏".equals(season)){
						summer++;
					}else if("冬".equals(season)){
						winter++;
					}
					/*
					 * 统计类型
					 */
					if("上衣".equals(category)){
						up++;
					}else if("下衣".equals(category)){
						down++;
					}else if("饰品".equals(category)){
						ornament++;
					}else if("鞋".equals(category)){
						shoes++;
					}else if("包".equals(category)){
						bag++;
					}
				}
		model.addAttribute("clothNum",clothNum);
		model.addAttribute("planNum",planNum);
		model.addAttribute("workNum",workNum);//正式
		model.addAttribute("planworkNum",planworkNum);
		model.addAttribute("relaxNum",relaxNum);//休闲
		model.addAttribute("planrelaxNum",planrelaxNum);
		model.addAttribute("sportNum",sportNum);//运动
		model.addAttribute("plansportNum",plansportNum);
		model.addAttribute("springAutumn",springAutumn);//春秋
		model.addAttribute("planspringAutumn",planspringAutumn);
		model.addAttribute("summer",summer);//夏
		model.addAttribute("plansummer",plansummer);
		model.addAttribute("winter",winter);//冬
		model.addAttribute("planwinter",planwinter);
		model.addAttribute("up",up);//上衣
		model.addAttribute("down",down);//下衣
		model.addAttribute("shoes",shoes);//鞋
		model.addAttribute("bag",bag);//包
		model.addAttribute("ornament",ornament);//首饰
////////////////////////////////
	
		
		
		return "clothCount";
	}
	
	//根据四个标签来查找出符合条件的
	@RequestMapping("clothTag")
	public String findClothByTag(String style, String season,
			String category,String userId,Model model,String jsp){
		if("up".equals(category)){
			category="上衣";
		}else if("down".equals(category)){
			category="下衣";
		}else if("shoes".equals(category)){
			category="鞋";
		}else if("shipin".equals(category)){
			category="饰品";
		}else if("bag".equals(category)){
			category="包";
		}
		if("springAutumn".equals(season)){
			season="春秋";
		}else if("summer".equals(season)){
			season="夏";
		}else if("winter".equals(season)){
			season="冬";
		}
		if("work".equals(style)){
			style="正式";
		}else if("relax".equals(style)){
			style="休闲";
		}else if("sport".equals(style)){
			style="运动";
		}
	System.out.println(category+","+style+","+season);
		//接收在service层处理好的季节符合的list
		List<Cloth>  clothList  = clothService.findClothByTag(style,season,category,userId);
		/*
		 * 
		 * 休闲衣服, 运动衣服,正式衣服的数量
		 * 以及对应数组存储
		 */
	
	System.out.println(clothList);
		int relaxNum=0 ;
		int	sportNum=0;
		int workNum = 0;
		
		for (Cloth cloth : clothList) {
			String clothStyle = cloth.getStyle();
			if(clothStyle.equals("休闲")){
				relaxNum++;
			}else if(clothStyle.equals("运动")){
				sportNum++;
			}else{
				workNum++;
			}
		}
		model.addAttribute("relaxNum", relaxNum);
		model.addAttribute("sportNum", sportNum);
		model.addAttribute("workNum", workNum);
		model.addAttribute("clothList", clothList);
	
		
		return jsp;
	}
	
	

	//修改单件衣服的信息
	@RequestMapping("toupdate")
	public String toupdate(String cId,Model model){
		Cloth cloth = clothService.findOneClothById(cId);
		model.addAttribute("cloth", cloth);
		//转发页面暂时未定
		return "update";	
	}
	
	@RequestMapping("update")
	public String update(Cloth cloth){
		clothService.updateCloth(cloth);
		//转发页面暂时未定
		return "clothList";	
	}
	
	
	//------------------------------------------------
	/**
	 * 根据衣物的id删除衣物
	 * 删除一件、多件通用、前端在所有衣物展示页面删除或在详情页面删除都可以使用本方法
	 * @param cId 衣物的id数组
	 * @return 不涉及数据转发，重定向回所有衣物页面（后续根据前端页面的目录结构进行修改）
	 */
	@RequestMapping("delete")
	public String delete(String[] cId){//为方便旗舰直接使用cId，不使用别名cIds
		clothService.deleteClothById(cId);
		return "redirect:list";//返回所有衣物界面
	}
	/**
	 * 根据搜索框输入的关键字进行模糊搜索
	 * @param word	输入的关键字
	 * @param model
	 * @return	返回一个新页面（后续根据前端目录结构更改）
	 */
	@RequestMapping("findLike")
	public String findLike(String word,Model model,String userId){
		//List<Cloth>  clothList = clothService.findLike(word);
		List<Cloth>  clothList = clothService.findLike(word,userId);
			model.addAttribute("clothList",clothList);
			return "searchList";
	}
	/**
	 * 点击添加衣物，跳转到添加页面
	 * @return	跳转到添加衣物页面（后续根据前端目录结构和页面名称进行更改）
	 */
	@RequestMapping("toCreate")
	public String toCreate(){
		return "addcloth";
	}
	/**
	*  提交衣物的表单后，保存数据并重定向回所有衣物页面
	 * @param cloth cloth	把表单的内容封装成Cloth对象
	 * @param session 取出session，为了获取当前登录的用户的id
	 * @return 无需转发数据，重定向回所有衣物页面
	 * @throws IOException 
	 */
/*	@RequestMapping("create")
	public String create(Cloth cloth,HttpServletSession session){
		String uId = (String) session.getAttribute("uId");
		if(uId==null){
			return "redirect:login";//如果session过期，用户没有登录，则返回登录界面
		}
		clothService.saveCloth(cloth,uId);
		return "redirect:list";
	}*/
	
	/*
	 * 这种方法是在serviceImpl中直接获取uid进行使用, 其使用threadLocal进行在用户登录的时候获取uid并存入线程,当需要使用的时候从其中拿出来并进行使用
	 */
	@RequestMapping("create")
	public String create(Cloth cloth,String uId,MultipartFile file ) throws IOException{
		String cId = UUID.randomUUID().toString();
		cloth.setId(cId);
		System.out.println("衣服图片上传前");
		FileUtils.writeByteArrayToFile(new File("C:\\images\\"+cId+".jpg"), file.getBytes());//文件上传,前端未定
		System.out.println("衣服上传后");
		//这里有保存file到图片服务器的功能
		System.out.println("衣服添加前");
		//读取配置文件中的Apache图片服务器的ip地址
		Properties pro=new Properties();
		pro.load(this.getClass().getClassLoader().getResourceAsStream("apacheIpProperties.properties"));
		String ip = pro.getProperty("ip");
		cloth.setUrl(ip+"/images/"+cId+".jpg");
		cloth.setCreateTime(new Date());
		cloth.setLastUpdateTime(new Date());
		clothService.saveCloth(cloth, uId);
		System.out.println("衣服添加完毕+uid="+uId);
		return "redirect:toclothUpList.action?userId="+uId;
	}
	
	
	
	
	
	
	

}