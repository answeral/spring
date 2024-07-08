package com.java.www;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex0708_02 {

	public static void main(String[] args) {
		//IOC 컨테이너에 있는 객체 소환 : xml 방법
		ClassPathXmlApplicationContext ctx = new
				ClassPathXmlApplicationContext("com/java/www/beans.xml");
		
		//IOC 컨테이너에 있는 객체 구현(수정 시 객체만 수정, 소스 수정 불필요)
		Pencil pencil = ctx.getBean("pencil",Pencil.class);
		pencil.use();
		
		//close 꼭 필요
		ctx.close();

	}

}
