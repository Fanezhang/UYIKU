package test;

import org.junit.Test;

public class BasicTest {
	@Test
	public void TrimTest(){
		String s="  123  ";
		System.out.println(s);
		System.out.println(s.trim());
	}
}
