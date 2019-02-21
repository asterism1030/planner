package com.project.message.model;

public class FriendRequestDto {

	private int fr_id;
	private String m_id;
	private String from_id;
	private String fr_date;
	private String fr_check;
	private String fr_content;
	private String from_name;

	public void setFrom_name(String from_name) {
		this.from_name = from_name;
	}

	public String getFrom_name() {
		return from_name;
	}

	public String getFr_content() {
		return fr_content;
	}

	public void setFr_content(String fr_content) {
		this.fr_content = fr_content;
	}

	public int getFr_id() {
		return fr_id;
	}

	public void setFr_id(int fr_id) {
		this.fr_id = fr_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getFrom_id() {
		return from_id;
	}

	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}

	public String getFr_date() {
		return fr_date;
	}

	public void setFr_date(String fr_date) {
		this.fr_date = fr_date;
	}

	public String getFr_check() {
		return fr_check;
	}

	public void setFr_check(String fr_check) {
		this.fr_check = fr_check;
	}

}
