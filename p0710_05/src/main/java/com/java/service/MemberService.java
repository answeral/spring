package com.java.service;

import com.java.dto.MemberDto;

public interface MemberService {
//인터페이스는 설계도
	MemberDto selectLogin(MemberDto mdto);

}
