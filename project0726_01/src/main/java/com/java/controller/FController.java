package com.java.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import org.springframework.http.HttpEntity;
import org.apache.catalina.connector.Response;
import org.apache.http.HttpStatus;
import org.apache.tomcat.util.json.JSONParser;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FController {

	@GetMapping("/index")
	public String index() {
		return"index";
	}
	
	@GetMapping("/list")
	public String list() {
		return"list";
	}
	
	@GetMapping("/map")
	public String map() {
		return"map";
	}
	
	@GetMapping("/Ftest")
	public String Ftest() {
		return"Ftest";
	}
	
	@GetMapping("/Ftest2")
	public String Ftest2() {
		return"Ftest2";
	}
	
	@GetMapping("/Ftest3")
	public String Ftest3() {
		return"Ftest3";
	}
	
	@GetMapping("/careAddr")
	public String careAddr() {
		return"careAddr";
	}
	
	@PostMapping("/public_data") // 공공데이터 - 관광사진갤러리 목록 조회
	@ResponseBody
    public String publicData() {
        String serviceKey = "gZGDkL8Vh2rSDfkVDrq72bASToGWeHx9ENaG8r0b9efl3aWQ%2BCevJCIRfoxbIjcz6GdttuxRafCStKITyYs%2B3g%3D%3D";
        String baseUrl = "https://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic";

        try {
            String queryParams = String.format("ServiceKey=%s&pageNo=%d&numOfRows=%d&_type=json", URLEncoder.encode(serviceKey, "UTF-8"), 1, 10);
            String fullUrl = baseUrl + "?" + queryParams;

            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.set("Content-Type", "application/json");
            HttpEntity entity = new HttpEntity(headers);

            ResponseEntity<String> response = restTemplate.exchange(fullUrl, HttpMethod.GET, entity, String.class);

            if (response.getStatusCode() == org.springframework.http.HttpStatus.OK) {
                // ObjectMapper를 사용하여 JSON 문자열을 JSON 객체로 변환
                ObjectMapper objectMapper = new ObjectMapper();
                JsonNode jsonNode = objectMapper.readTree(response.getBody());
                // 필요한 처리 수행
                return jsonNode.toString();
            } else {
                throw new RuntimeException("Failed to fetch data from API: " + response.getStatusCode());
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to fetch data from API", e);
        }
    }
}