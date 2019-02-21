package com.project.member.model.dao;

import java.util.List;
import java.util.Map;

import com.project.member.model.MemberDto;
 
public interface MemberDao {
	
	int idCheck(String id); 
	int register(MemberDto memberDto);
	
	MemberDto login(Map<String, String> map);
	
	MemberDto facebookLogin(Map<String, String> map);
	
	void modifyMember(MemberDto memberDto);
	
	void changePass(Map<String, String> map);
	
	int checkMember(String email, String name, String birth);
	String changePass(String email);
}

