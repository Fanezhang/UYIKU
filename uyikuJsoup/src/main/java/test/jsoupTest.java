package test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;

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
}
