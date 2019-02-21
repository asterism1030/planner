package com.project.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.admin.model.service.AdminServiceImpl;
import com.project.factory.AdminActionFactory;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;
import com.project.util.Encoder;
import com.project.util.MovePage;

@WebServlet("/adminmember")
public class AdminMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	List<MemberDto> dblist = new ArrayList<>();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		String root  = request.getContextPath();
		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if ("mvmember".equals(act)){
			String path = "/admin/accountManage.jsp";
			MovePage.redirect(root+path, response);
			
		} else if("dataMember".equals(act)) {
			dblist = AdminServiceImpl.getAdminServiceImpl().getMembers();
			String msg = AdminActionFactory.getListMemberAction().action(request, response);
			out.println(msg);
		
		} else if("search".equals(act)) {
			String key = request.getParameter("key");
			String word = request.getParameter("word");
			
			
			String sendmsg = "";
			if("m_id".equals(key) || "m_birth".equals(key))
				sendmsg = makeJsonForm(key, word);
			else if("m_name".equals(key)) {
				sendmsg = AdminActionFactory.getSearchMemberAction().action(request, response);
			}
			out.println(sendmsg);
			
		} else if("modify".equals(act)) {
			AdminActionFactory.getSaveMemberAction().action(request, response);
			JSONObject json = new JSONObject();
			json.put("msg", "���������� ����Ǿ����ϴ�");
			out.println(json.toJSONString());
			
		} else if("delete".equals(act)) {
			String sendmsg = AdminActionFactory.getDeleteMemberAction().action(request, response);
			JSONObject json = new JSONObject();
			json.put("msg", sendmsg);
			out.println(json.toJSONString());
			
		} else if("dataAdmin".equals(act)) {
			String sendmsg = makeJsonForm("m_id", "admin@naver.com");
			out.println(sendmsg);
		}
	
	}
	
	
	//�˻� â ���� ��Ÿ�� ����Ʈ�� ǥ���� �����͵��� json ��Ʈ�� �������� ����
	public String makeJsonForm(String key, String word) {
		int size = dblist.size();
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		
		for(int i = 0; i < size; i ++) {
			String dbkeyword = "";
			
			if("m_id".equals(key)) {
				dbkeyword = dblist.get(i).getM_id(); //key�� ���� ��ȭ!!!!!!!!!!!
			} else if ("m_birth".equals(key)) {
				dbkeyword = dblist.get(i).getM_birth();
			} else if ("m_name".equals(key)) {
				dbkeyword = dblist.get(i).getM_name();
			}
			
			if(dbkeyword.toUpperCase().startsWith(word.toUpperCase())) {
				JSONObject obj = new JSONObject();
				obj.put("m_id", dblist.get(i).getM_id());
				obj.put("m_name", dblist.get(i).getM_name());
				obj.put("m_pass", dblist.get(i).getM_pass());
				obj.put("m_birth", dblist.get(i).getM_birth());
				obj.put("m_gender", dblist.get(i).getM_gender());
				
				//����� �÷���
				List<PlannerDto> plans = AdminServiceImpl.getAdminServiceImpl().getPlanners(dblist.get(i).getM_id());
				int psize = plans.size();
				JSONArray parray = new JSONArray();
				for(int j=0; j < psize; j++) {
					JSONObject pobj = new JSONObject();
					pobj.put("p_id", plans.get(j).getP_id());
					pobj.put("p_subject", plans.get(j).getP_subject());
					pobj.put("likes", plans.get(j).getLikes());
					parray.add(pobj);
				}
				obj.put("plans",parray);
				/////////////////////////////
				//����� ģ��
				List<String> friends = AdminServiceImpl.getAdminServiceImpl().getFriends(dblist.get(i).getM_id());
				int fsize = friends.size();
				JSONArray farray = new JSONArray();
				for(int j=0; j < fsize; j++) {
					JSONObject fobj = new JSONObject();
					fobj.put("f_id", friends.get(j));
					farray.add(fobj);
				}
				obj.put("friends",farray);
				array.add(obj);
			}
		}
		json.put("members", array);
		
		return json.toJSONString();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
