package test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jsoup.Connection;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;

import com.fasterxml.jackson.databind.ObjectMapper;

public class jsoupTest {
	@Resource
	private Logger log;
	@Test
	public void test(){
		try {
			String a = Jsoup.connect("http://www.taobao.com").execute().body();
			System.out.println(a);
		} catch (IOException e) {
			log.error("错误，洒洒水啦！");	
			e.printStackTrace();
		}
	}
	/**
	 * 抓数据、写文件测试
	 * @throws IOException
	 */
	@Test
	public void test2() throws IOException{
		String url="http://www.taobao.com";
		Document doc=null; 
		try {
			doc= Jsoup.connect(url).get();
		} catch (IOException e) {
			log.error(e);
			e.printStackTrace();
		}
		Elements eles = doc.select("a");
		File file=new File("D:\\java\\WorkspaceMars\\uyikuSpace\\uyiku\\jsoupTest.txt");
		Writer writer=new FileWriter(file,true);
		BufferedWriter bw=new BufferedWriter(writer);
			for (Element ele : eles) {
				String h = ele.attr("href");
				String text = ele.text().trim();
				if("".equals(text)||text==null||h.contains("javascript:;")){
					continue;
				}
				bw.write(text+"\t=="+h+"\r\n");
				
				System.out.println(text+"---"+h);
			}
			bw.write("------------------------------------------------------------\r\n");
//			bw.flush();
			bw.close();
			
	}
	//按女装分类爬数据
	@Test
	public void test3(){
		int count=1;
		String url="https://www.taobao.com/markets/nvzhuang/taobaonvzhuang";
		Document doc=null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements link = doc.select("dd a");
		for (Element element : link) {
			String href = element.attr("href");
			String text = element.text();
			if(href.contains("javascript")){
				continue;
			}
//			System.out.println(count+++"."+text+":"+href);
			System.out.println(count+" "+text+":"+href);
			//https://tmatch.simba.taobao.com/?name=tbuad&o=j&pid=420434_1006&count=12&keyword=&p4p=tbcc_p4p_c2015_8_130027_14918041125041491804116091&catid=1623&se=3aba140c15b8ae4295cea246d7325fda
			//第二层遍历
			Document doc2 =null;
			int count2=1;
			try {
				doc2= Jsoup.connect(href).get();
			} catch (IOException e) {
				e.printStackTrace();
			}
			Elements link2 = doc2.select("script");
			for (Element element2 : link2) {
				String src2 = element2.attr("src");
				
				System.out.println(src2);
				
//				String href2 = element2.attr("href");
//				String text2 = element2.text();
//				if(href2.contains("javascript")){
//					continue;
//				}
//				System.out.println("\t"+count+"."+count2+" "+text2+":");
//				count2++;
			}
			count++; 
		}
	}
	@Test
	public void test4() {
		String url="https://tmatch.simba.taobao.com/?name=tbuad&o=j&pid=420434_1006&count=12&keyword=&p4p=tbcc_p4p_c2015_8_130027_14918041125041491804116091&catid=1624&se=3aba140c15b8ae4295cea246d7325fda";
		
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
					System.out.println(itemUrl);
					//第二层 商品详情页
					Document doc = Jsoup.connect(itemUrl).get();
					Elements eles = doc.select("#J_Title h3");
					if(eles.toString().equals("")){
//						eles=doc.select("div[class=tb-detail-hd] h1");
//						eles=doc.select("span[class=tm-count]");销量
//						eles=doc.select("#J_deliveryAdd");todo
						eles=doc.select("#J_AttrUL li");
					}
					for (Element element : eles) {
						String text = element.text();
						System.out.println("\t"+text);
					}
//					System.out.println(string);
				}

//				System.out.println(substring);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	//遍历url
	@Test
	public void test5() throws IOException, InterruptedException {
		int pid=0;
		//写文件
		File file=new File("D:\\java\\WorkspaceMars\\uyikuSpace\\uyiku\\jsoupTestItem.txt");
		Writer writer=new FileWriter(file,true);
		BufferedWriter bw=new BufferedWriter(writer);
		//设置map进行校验
		Map<String,String> dataMap=new HashMap<String,String>();
		for(int i=0;i<10000;i++){
			String url="https://tmatch.simba.taobao.com/?name=tbuad&o=j&pid="+(pid++)+"&count=12&keyword=&p4p=tbcc_p4p_c2015_8_130027_14918041125041491804116091&catid=1624&se=3aba140c15b8ae4295cea246d7325fda";
			
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
					if(dataMap.get(title)==null){//去除重复项
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
							System.out.println("\t\t"+attr);
							bw.write("\t\t"+attr+"\r\n");
						}
						//图片url
						String imgUrl = "http:"+eleImg.attr("src");
						System.out.println("\t图片地址："+imgUrl);
						bw.write("\t图片地址："+imgUrl+"\r\n");
						
						dataMap.put(title,itemUrl);//把标题存入map
						bw.flush();
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
	//遍历catId和pid
	@Test
	public void test6() throws IOException, InterruptedException, URISyntaxException {
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
						boolean flag=false;
						for(String key:keywords){
							if(title.contains(key)){
								flag=true;
								break;
							}
						}
						if(dataMap.get(title)==null&&flag==true){//去除重复项
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
								System.out.println("\t\t"+attr);
								bw.write("\t\t"+attr+"\r\n");
							}
							//图片url
							String imgUrl = "http:"+eleImg.attr("src");
							System.out.println("\t图片地址："+imgUrl);
							bw.write("\t图片地址："+imgUrl+"\r\n");
							
							dataMap.put(title,itemUrl);//把标题存入map
							bw.flush();
							
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
	//测试getResource
	@Test
	public void test7() throws IOException, URISyntaxException{
			Properties pro=new Properties();
			
			pro.load(this.getClass().getClassLoader().getResourceAsStream("jsoup.properties"));
			pro.setProperty("idid", 3+"");
			pro.store(new FileOutputStream(new File(this.getClass().getClassLoader().getResource("jsoup.properties").toString())), null);
			
	}
}
