package com.java.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FController {
	
		@GetMapping("/index")
		public String index() {
			return"index";
		}
		
		@PostMapping("/public_data")
		@ResponseBody
		public String public_data() throws Exception {
			 String service_key = "gZGDkL8Vh2rSDfkVDrq72bASToGWeHx9ENaG8r0b9efl3aWQ%2BCevJCIRfoxbIjcz6GdttuxRafCStKITyYs%2B3g%3D%3D";
			 String web_url = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc";
			
			   StringBuilder urlBuilder = new StringBuilder(web_url); /*URL*/
			   urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("careNm","UTF-8") + "=" + URLEncoder.encode("이기영수의과병원", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("careAddr","UTF-8") + "=" + URLEncoder.encode("충청남도 공주시 감영길 7 (반죽동)", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*요청자료형식(XML/JSON)*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        System.out.println("Response code: " + conn.getResponseCode());
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		        System.out.println(sb.toString());
		        return sb.toString();
		}
		
		
		
		
		
}
