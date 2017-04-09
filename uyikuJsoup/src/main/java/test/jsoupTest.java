package test;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
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
}
