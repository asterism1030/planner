package com.project.mail;

import javax.mail.MessagingException;

public class PostMan {

 
 String from = "rlaguswl1030@gmail.com";
 String to = "";
 String cc = "";     //����. ���� ����!
 String pass = "";
 String subject = "<mytraveldairy> �ش� �̸����� ��й�ȣ�� ����Ǿ����ϴ�";// ����
 String content = "";// ����
 
 public PostMan(String to, String pass){
	 this.to= to;
	 this.pass = pass;
	 this.content = to+" ���� �ӽ� ��й�ȣ�� ' "+ pass +" ' �� ����Ǿ����ϴ�.\n�ش� ��й�ȣ�� ��α����� �ּ���.";// ����";
 }
 
 public void result(){
 if(from.trim().equals("")) {
  //System.out.println("������ ����� �Է����� �ʾҽ��ϴ�.");
 }
 else if(to.trim().equals("")) {
  //System.out.println("�޴� ����� �Է����� �ʾҽ��ϴ�.");
 }
 else {
  try {
   MailTest mt = new MailTest();
   
   // ���Ϻ�����
   mt.sendEmail(from, to, cc, subject, content);
   //System.out.println("���� ���ۿ� �����Ͽ����ϴ�.");
  }
  catch(MessagingException me) {
   //System.out.println("���� ���ۿ� �����Ͽ����ϴ�.");
   //System.out.println("���� ���� : " + me.getMessage());
  }
  catch(Exception e) {
   //System.out.println("���� ���ۿ� �����Ͽ����ϴ�.");
   //System.out.println("���� ���� : " + e.getMessage());
  }
 }
 }
}