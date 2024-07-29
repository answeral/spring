package com.java.controller;

import java.io.StringReader;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class LMapController2 {


@GetMapping("/getAnimalData")
    public AnimalData getAnimalData() throws JAXBException {
        String url = "https://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=gZGDkL8Vh2rSDfkVDrq72bASToGWeHx9ENaG8r0b9efl3aWQ%2BCevJCIRfoxbIjcz6GdttuxRafCStKITyYs%2B3g%3D%3D&pageNo=1&numOfRows=10&_type=xml"; // 공공데이터 API의 URL을 입력합니다.
        RestTemplate restTemplate = new RestTemplate();
        String response = restTemplate.getForObject(url, String.class);

        // JSON 데이터를 객체로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        AnimalData animalData = null;
		try {
			animalData = objectMapper.readValue(response, AnimalData.class);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        return animalData;
    }
}