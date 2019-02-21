package com.project.comment.model.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.comment.model.dao.CommentDaoImpl;
import com.project.comment.model.CommentDto;

public class CommentServiceImpl implements CommentService {
	
	private static CommentServiceImpl commentServiceImpl;
	
	static {
		commentServiceImpl = new CommentServiceImpl();
	}
	
	private CommentServiceImpl() {}
	

	public static CommentServiceImpl getCommentServiceImpl() {
		return commentServiceImpl;
	}



	@Override
	public String groupCommentList(String p_id) {
		List<CommentDto> list = CommentDaoImpl.getCommentDaoImpl().groupCommentList(p_id);
		JSONObject json = new JSONObject();
		JSONArray jarray =  new JSONArray();
		for(CommentDto commentDto : list) {
			JSONObject jobj = new JSONObject();
			jobj.put("gc_id", commentDto.getGc_id());
			jobj.put("p_id", commentDto.getP_id());
			jobj.put("g_id", commentDto.getG_id());
			jobj.put("m_id", commentDto.getM_id());
			jobj.put("m_name", commentDto.getM_name());
			jobj.put("gc_content", commentDto.getGc_content());
			jobj.put("gc_date", commentDto.getGc_date());
			
			jarray.add(jobj);
		}
		json.put("commentlist", jarray);
		return json.toJSONString();
	}

	@Override
	public void groupCommentWrite(CommentDto commentDto) {
		CommentDaoImpl.getCommentDaoImpl().groupCommentWrite(commentDto);
	}


	@Override
	public void groupCommentDelete(int gc_id) {
		CommentDaoImpl.getCommentDaoImpl().groupCommentDelete(gc_id);
	}


	@Override
	public void groupCommentModify(CommentDto commentDto) {
		CommentDaoImpl.getCommentDaoImpl().groupCommentModify(commentDto);
	}


	@Override
	public String commentList(String p_id) {
		List<CommentDto> list = CommentDaoImpl.getCommentDaoImpl().commentList(p_id);
		JSONObject json = new JSONObject();
		JSONArray jarray =  new JSONArray();
		for(CommentDto commentDto : list) {
			JSONObject jobj = new JSONObject();
			jobj.put("gc_id", commentDto.getGc_id());
			jobj.put("p_id", commentDto.getP_id());
			jobj.put("g_id", commentDto.getG_id());
			jobj.put("m_id", commentDto.getM_id());
			jobj.put("m_name", commentDto.getM_name());
			jobj.put("gc_content", commentDto.getGc_content());
			jobj.put("gc_date", commentDto.getGc_date());
			
			jarray.add(jobj);
		}
		json.put("commentlist", jarray);
		return json.toJSONString();
	}


	@Override
	public void commentWrite(CommentDto commentDto) {
		CommentDaoImpl.getCommentDaoImpl().commentWrite(commentDto);
	}


	@Override
	public void commentDelete(int gc_id) {
		CommentDaoImpl.getCommentDaoImpl().commentDelete(gc_id);
	}


	@Override
	public void commentModify(CommentDto commentDto) {
		CommentDaoImpl.getCommentDaoImpl().commentModify(commentDto);
	}

}

