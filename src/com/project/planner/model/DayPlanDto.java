package com.project.planner.model;

public class DayPlanDto {
	private int p_id;
	private String dp_date;
	private String dp_memo;
	private String dp_lodgment;
	private String dp_transportation;
	private int g_id;

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getDp_date() {
		return dp_date;
	}

	public void setDp_date(String dp_date) {
		this.dp_date = dp_date;
	}

	public String getDp_memo() {
		return dp_memo;
	}

	public void setDp_memo(String dp_memo) {
		this.dp_memo = dp_memo;
	}

	public String getDp_lodgment() {
		return dp_lodgment;
	}

	public void setDp_lodgment(String dp_lodgment) {
		this.dp_lodgment = dp_lodgment;
	}

	public String getDp_transportation() {
		return dp_transportation;
	}

	public void setDp_transportation(String dp_transportation) {
		this.dp_transportation = dp_transportation;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

}
