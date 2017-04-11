package cn.uyiku.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.jsoup.Connection;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import cn.uyiku.pojo.Item;
import cn.uyiku.service.ItemService;
import cn.uyiku.util.ItemUtil;

@RestController
//@MapperScan("cn.uyiku.mapper")
public class StartController {
	@Resource
	private ItemService itemService;
	
	@RequestMapping("in")
	public ModelAndView index(){
		return new ModelAndView("index");
	}
	@RequestMapping("go")
	public void start(){
		try {
			jsoupMain();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void jsoupMain() throws IOException{
		
		Properties prop=new Properties();
		//断点续爬
		prop.load(this.getClass().getClassLoader().getResourceAsStream("jsoup.properties"));
		int pid = Integer.parseInt(((String)(prop.get("pid")==null?"0":prop.get("pid"))));
		int catId=Integer.parseInt(((String)(prop.get("catId")==null?"0":prop.get("catId"))));
		int itemNum=Integer.parseInt(((String)(prop.get("itemNum")==null?"0":prop.get("itemNum"))));
		String[] keywords={"服装","衣服","外套","上衣","风衣","外衣","男装","女装","裤","裙","潮牌","短袖","长袖","马甲","夹克","衫","职业装","牛仔","礼服"};
		//写文件
		File file=new File("D:\\java\\WorkspaceMars\\uyikuSpace\\uyiku\\jsoupTestItemByIdAndCatId.txt");
		Writer writer=new FileWriter(file,true);
		BufferedWriter bw=new BufferedWriter(writer);
		//设置map进行校验
		Map<String,String> dataMap=new HashMap<String,String>();
		for(int i=pid;i<100000000;i++){
			for(int j=catId;j<9999;j++){
				System.out.println("=========================\npid:"+i+"\tcatId:"+j+"\t商品数量："+(itemNum+1)+"\n=========================");
				String url="https://tmatch.simba.taobao.com/?name=tbuad&o=j&pid="+i+"&count=12&keyword=&p4p=tbcc_p4p_c2015_8_130027_14918041125041491804116091&catid="+j+"&se=3aba140c15b8ae4295cea246d7325fda";
				//写文件，支持断点续爬
				prop.setProperty("pid",i+"");
				prop.setProperty("catId",j+"");
				prop.store(new FileOutputStream(new File("src/main/resources/jsoup.properties")),null);
				
				Connection connect = Jsoup.connect(url);
				try {
					Response re = connect.ignoreContentType(true).execute();
					String body = re.body();
					//把jsonp格式转为json格式
					int index = body.indexOf("[");
					int last = body.lastIndexOf("]");
					String substring = body.substring(index+1, last);
					//分割json
					String[] split = substring.split("},");
					for (String string : split) {//遍历分割出来的数组
						string=string+"}";
						if(string.contains("}}")){//去掉最后一条数据多余的右括号
							string=string.substring(0,string.length()-1);
						}
						//把json转为map
						ObjectMapper om=new ObjectMapper();
	//					JsonNode r = om.readTree(string);
	//					JsonNode jsonNode = r.get("EURL");
	//					System.out.println(jsonNode.toString());
						Map<String,String> map=om.readValue(string,Map.class);
						String itemUrl = map.get("EURL");
						//第二层 商品详情页
						Document doc = Jsoup.connect(itemUrl).get();
						Thread.sleep(2000);
						//--------淘宝--------
						Element ele = doc.select("#J_Title h3").first();//标题
						Element eleXl=doc.select("#J_SellCounter").first();//销量
						Elements elesSx=doc.select("ul[class=attributes-list] li");//商品属性
						//--------天猫--------
						if(ele==null||ele.toString().equals("")){
							ele=doc.select("div[class=tb-detail-hd] h1").first();//标题
							eleXl=doc.select("span[class=tm-count]").first();//销量
	//						eles=doc.select("#J_deliveryAdd");todo
							elesSx=doc.select("#J_AttrUL li");//商品属性
						}
						Element eleImg = doc.select("#J_ImgBooth").first();//图片地址，淘宝天猫相同
						String title = ele.text();
						//筛选关键字
						boolean flag=false;
						for(String key:keywords){
							if(title.contains(key)){
								flag=true;
								break;
							}
						}
						if(dataMap.get(title)==null&&flag==true){//去除重复项
							String seasonAndTime="-";//季节和时间
							String brand="-";//品牌
							String category="-";//类别
							//详情页链接
							System.out.println(itemUrl);
							bw.write(itemUrl+"\r\n");
							//标题
							System.out.println("\t"+title);
							bw.write("\t"+title+"\r\n");
							//销量
							String saleNum = eleXl.text();
							System.out.println("\t销量："+saleNum);
							bw.write("\t销量："+saleNum+"\r\n");
							//商品属性
							System.out.println("\t商品属性:");
							bw.write("\t商品属性:\r\n");
							for (Element element : elesSx) {
								String attr = element.text();
								//分离出需要的属性
								if(attr.contains("年份季节")){
									seasonAndTime = attr.split(":")[1].trim();
								}else if(attr.contains("品牌")){
									brand=attr.split(":")[1].trim();
								}else if(attr.contains("基础风格")){
									category=attr.split(":")[1].trim();
								}
								System.out.println("\t\t"+attr);
								bw.write("\t\t"+attr+"\r\n");
							}
							//图片url
							String imgUrl = "http:"+eleImg.attr("src");
							System.out.println("\t图片地址："+imgUrl);
							bw.write("\t图片地址："+imgUrl+"\r\n");
							
							dataMap.put(title,itemUrl);//把标题存入map
							bw.flush();
							//封装成对象
							int saleN = Integer.parseInt(saleNum.equals("-")?"0":saleNum);
							Item item =null;
							try{
								item = ItemUtil.StringToItem(itemNum, itemUrl, title,saleN, seasonAndTime, brand, category, imgUrl);
							}catch (Exception e) {
								e.printStackTrace();
							}
							itemService.save(item);
							
							prop.setProperty("itemNum",++itemNum+"");
							prop.store(new FileOutputStream(new File("src/main/resources/jsoup.properties")),null);
							
						}
	//					System.out.println(string);
					}
	
	//				System.out.println(substring);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	//			System.out.println("========================================================================================================");
	//			bw.write("=================================================================================================================\r\n");
			}
			bw.close();
		}
	}
}
