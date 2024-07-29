package com.java.controller;
import com.fasterxml.jackson.annotation.JsonProperty;

public class AnimalData {
   
	
	@JsonProperty("careAddr")
    private String careAddr;

    public String getCareAddr() {
        return careAddr;
    }

    public void setCareAddr(String careAddr) {
        this.careAddr = careAddr;
    }

    // 다른 필드들도 추가
}