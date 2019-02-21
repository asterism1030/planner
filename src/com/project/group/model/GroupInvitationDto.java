package com.project.group.model;

public class GroupInvitationDto {

	private int gi_id;
	private int g_id;
	private String p_subject;
	private String m_id;
	private String m_name;
	private String to_id;
	private String gi_date;
	private String gi_check;
	private String gi_content;
	private String p_img;
	
	

	public final String getM_name() {
		return m_name;
	}

	public final void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public final String getP_img() {
		return p_img;
	}

	public final void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public int getGi_id() {
		return gi_id;
	}

	public int getG_id() {
		return g_id;
	}

	public String getP_subject() {
		return p_subject;
	}

	public String getM_id() {
		return m_id;
	}

	public String getTo_id() {
		return to_id;
	}

	public String getGi_date() {
		return gi_date;
	}

	public String getGi_check() {
		return gi_check;
	}

	public String getGi_content() {
		return gi_content;
	}

	public void setGi_id(int gi_id) {
		this.gi_id = gi_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public void setP_subject(String p_subject) {
		this.p_subject = p_subject;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}

	public void setGi_date(String gi_date) {
		this.gi_date = gi_date;
	}

	public void setGi_check(String gi_check) {
		this.gi_check = gi_check;
	}

	public void setGi_content(String gi_content) {
		this.gi_content = gi_content;
	}

}
