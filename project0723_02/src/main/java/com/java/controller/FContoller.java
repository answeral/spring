package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FContoller {
	
	
	
	
	@GetMapping("/index")
	@ResponseBody
	public String index(@RequestParam(defaultValue = "1") String page) throws Exception {
		 //api호출
		String service_key ="gZGDkL8Vh2rSDfkVDrq72bASToGWeHx9ENaG8r0b9efl3aWQ%2BCevJCIRfoxbIjcz6GdttuxRafCStKITyYs%2B3g%3D%3D";
		String web_url = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc";
		
		StringBuilder urlBuilder = new StringBuilder(web_url);
		urlBuilder.append();
		
		return "index";
	}
	
	
	
	
	
	
	@GetMapping("/centerMap")
	public String centerMap() {
		return "centerMap";
	}
	
	@PostMapping("centerMap2")
	@ResponseBody
	public String centerMap2() {
		return"/centerMap2";
	}
	
	
}
