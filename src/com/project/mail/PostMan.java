package com.project.mail;

import javax.mail.MessagingException;

public class PostMan {

 
 String from = "rlaguswl1030@gmail.com";
 String to = "";
 String cc = "";     //참조. 쓰지 않음!
 String pass = "";
 String subject = "<mytraveldairy> 해당 이메일의 비밀번호가 변경되었습니다";// 제목
 String content = "";// 내용
 
 public PostMan(String to, String pass){
	 this.to= to;
	 this.pass = pass;
	 this.content = to+" 님의 임시 비밀번호는 ' "+ pass +" ' 로 변경되었습니다.\n해당 비밀번호로 재로그인해 주세요.";// 내용";
 }
 
 public void result(){
 if(from.trim().equals("")) {
  //System.out.println("보내는 사람을 입력하지 않았습니다.");
 }
 else if(to.trim().equals("")) {
  //System.out.println("받는 사람을 입력하지 않았습니다.");
 }
 else {
  try {
   MailTest mt = new MailTest();
   
   // 메일보내기
   mt.sendEmail(from, to, cc, subject, content);
   //System.out.println("메일 전송에 성공하였습니다.");
  }
  catch(MessagingException me) {
   //System.out.println("메일 전송에 실패하였습니다.");
   //System.out.println("실패 이유 : " + me.getMessage());
  }
  catch(Exception e) {
   //System.out.println("메일 전송에 실패하였습니다.");
   //System.out.println("실패 이유 : " + e.getMessage());
  }
 }
 }
}