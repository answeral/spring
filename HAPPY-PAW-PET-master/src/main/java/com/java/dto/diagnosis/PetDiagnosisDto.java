package com.java.dto.diagnosis;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetDiagnosisDto {
    // 공통 질문
    private int dno;
    private String id;
    private String pname;
    private Date pbirth;
    private int page;
    private String psex;
    private String psurgery;  //중성화 여부 yes or no
    private float pweight;
    private String pbreed;
    private String condition; // 질병 유형 (eye, skin)
    private String pfile;
    private Date diagnosisdate; //진단날짜, default=sysdate

    // 안구질환 질문
    private Integer eye1; //int 1/0
    private int eye2;
    private int eye3;
    private int eye4;
    private int eye5;
    private String eyecolor; // 녹색, 빨간색, 흰색, 검은색

    // 피부질환 질문
    private int skin1; //int 1/0
    private int skin2;
    private int skin3;
    private int skin4;
    private int skin5;

}

