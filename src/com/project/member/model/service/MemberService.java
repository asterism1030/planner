package com.project.member.model.service;

import java.util.List;

import com.project.member.model.MemberDto;

public interface MemberService {

	int emailCheck(String email);   //select count(id) 이므로. id가 존재할 경우 1, X경우 0
	int register(MemberDto memberDto); //select count(~).
	
	MemberDto login(String email, String pass);
	MemberDto facebookLogin(String email, String pass, String name, String gender);

	void modifyMember(MemberDto memberDto);
	void changePass(String m_id, String pass);
	
	int checkMember(String email, String name, String birth);
	String changePass(String email);
}
