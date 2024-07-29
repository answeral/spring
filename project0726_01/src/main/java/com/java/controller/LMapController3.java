package com.java.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.swing.text.html.parser.Entity;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;



@Controller
public class LMapController3 {

	 private static final String API_KEY = ""; // 카카오 API 키
	
	 public static void main(String[] args) {
		    String address = ("경기도 양주시 남면 감악산로 63-37");          
		    
		    Float[] coordinates = geoCoding(address);
	        
	        if (coordinates != null) {
	            System.out.println("Latitude: " + coordinates[0]);
	            System.out.println("Longitude: " + coordinates[1]);
	        } else {
	            System.out.println("Address not found or error occurred.");
	        }
	    }

	    public static Float[] geoCoding(String address) {
	        if (address == null || address.isEmpty()) {
	            return null;
	        }

	        // URL 인코딩
	        String encodedAddress = address.replace(" ", "+");
	        String requestUrl = "https://dapi.kakao.com/v2/local/search/address.json?query=" + encodedAddress;
	        
	        try {
	            encodedAddress = URLEncoder.encode(address, "UTF-8");
	            System.out.println("Encoded Address: " + encodedAddress);
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	            System.err.println("Encoding error: " + e.getMessage());
	        }

	        try (CloseableHttpClient client = HttpClients.createDefault()) {
	            HttpGet request = new HttpGet(requestUrl);
	            request.setHeader("Authorization", "KakaoAK " + API_KEY);

	            try (CloseableHttpResponse response = client.execute(request)) {
	                HttpEntity entity = response.getEntity();

	                if (entity != null) {
	                    String responseString = EntityUtils.toString(entity);
	                    JSONObject jsonResponse = new JSONObject(responseString);

	                    // Check if documents array is present and has elements
	                    if (jsonResponse.has("documents") && jsonResponse.getJSONArray("documents").length() > 0) {
	                        JSONObject addressData = jsonResponse
	                                .getJSONArray("documents")
	                                .getJSONObject(0)
	                                .getJSONObject("address");

	                        // Check if the required fields are present
	                        if (addressData.has("x") && addressData.has("y")) {
	                            Float[] coords = new Float[2];
	                            coords[0] = Float.parseFloat(addressData.getString("y"));
	                            coords[1] = Float.parseFloat(addressData.getString("x"));

	                            return coords;
	                        } else {
	                            System.err.println("Geocoding API error: Missing coordinates in response");
	                        }
	                    } else {
	                        System.err.println("Geocoding API error: No results found");
	                    }
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.err.println("Error occurred while geocoding: " + e.getMessage());
	        }

	        return null;
	    }
	}