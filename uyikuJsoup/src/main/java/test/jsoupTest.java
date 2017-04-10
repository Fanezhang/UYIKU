package test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Map;

import javax.annotation.Resource;
import javax.swing.plaf.basic.BasicTreeUI.TreeCancelEditingAction;

import org.apache.log4j.Logger;
import org.jsoup.Connection;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;

import com.fasterxml.jackson.databind.JsonNode;
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
	
}
