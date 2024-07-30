package com.java.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import jakarta.mail.Address;

@Controller
public class PublicData2 {
	
	
	@PostMapping("/public_data2") // 공공데이터 - 관광사진갤러리 목록 조회
	@ResponseBody
	public String publicData() throws Exception {
	    // API 호출
		String serviceKey = "gZGDkL8Vh2rSDfkVDrq72bASToGWeHx9ENaG8r0b9efl3aWQ%2BCevJCIRfoxbIjcz6GdttuxRafCStKITyYs%2B3g%3D%3D";
	    String webUrl = "https://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic";
	    
	    StringBuilder urlBuilder = new StringBuilder(webUrl); /* URL */
	    urlBuilder.append("?");
	    urlBuilder.append("ServiceKey=").append(serviceKey); /* Service Key */
	    urlBuilder.append("&pageNo=1"); /* 페이지 번호 */
	    urlBuilder.append("&numOfRows=100"); /* 한 페이지 결과 수 (최대 1000) */
	    urlBuilder.append("&_type=json"); /* 요청 자료 형식 (XML/JSON) */

	    URL url = new URL(urlBuilder.toString());
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/json");

	    int responseCode = conn.getResponseCode();
	    System.out.println("Response code: " + responseCode);

	    BufferedReader rd;
	    if (responseCode >= 200 && responseCode < 300) {
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

	    String response = sb.toString();
	    System.out.println("Response: " + response); // 응답 내용 확인
 	    
	    System.out.println("sb.toString() :"+sb.toString());
	    return sb.toString();
	    

	    
	
	}

}
