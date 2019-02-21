package com.project.comment.model;

public class CommentDto {

	private int gc_id;
	private String g_id;
	private String p_id;
	private String m_id;
	private String m_name;
	private String gc_content;
	private String gc_date;
	

	public int getGc_id() {
		return gc_id;
	}

	public void setGc_id(int gc_id) {
		this.gc_id = gc_id;
	}

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getGc_content() {
		return gc_content;
	}

	public void setGc_content(String gc_content) {
		this.gc_content = gc_content;
	}

	public String getGc_date() {
		return gc_date;
	}

	public void setGc_date(String gc_date) {
		this.gc_date = gc_date;
	}
	
}
