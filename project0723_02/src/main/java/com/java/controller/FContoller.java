package com.java.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

import jakarta.servlet.http.HttpSession;

@Controller
public class FContoller {
	
	@GetMapping("/public_data")
	@ResponseBody
	public ResponseEntity<String> public_data() {
	    try {
	        String service_key = "gZGDkL8Vh2rSDfkVDrq72bASToGWeHx9ENaG8r0b9efl3aWQ%2BCevJCIRfoxbIjcz6GdttuxRafCStKITyYs%2B3g%3D%3D";
	        String web_url = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc";

	        // URL 및 파라미터 설정
	        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(web_url)
	                .queryParam("ServiceKey", service_key)
	                .queryParam("numOfRows", 10) // 필요한 데이터 수 설정
	                .queryParam("pageNo", 1) // 페이지 번호 설정
	                .queryParam("careNm", "창원유기동물보호소") // 검색 조건 설정
	                .queryParam("careAddr", "경상남도 창원시 의창구 창이대로 71 (명서동, 창원시농업기술센터) 축산과")
	                .queryParam("_type", "json"); // 결과 형식 설정

	        URL url = new URL(builder.toUriString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");

	        StringBuilder sb = new StringBuilder();
	        try (BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
	            String line;
	            while ((line = rd.readLine()) != null) {
	                sb.append(line);
	            }
	        }

	        return ResponseEntity.ok(sb.toString());
	    } catch (MalformedURLException e) {
	        // URL 형식이 잘못된 경우 처리
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Malformed URL");
	    } catch (IOException e) {
	        // 입출력 예외 발생 시 처리
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("IO Exception");
	    } catch (Exception e) {
	        // 그 외 예외 처리
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Unknown Error");
	    }
	}

	
	
	
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	@GetMapping("/centerMap")
	public String centerMap() {
		return "centerMap";
	}
	
	@GetMapping("/centerMap2")
	public String centerMap2() {
		return"centerMap2";
	}
	
	
}
