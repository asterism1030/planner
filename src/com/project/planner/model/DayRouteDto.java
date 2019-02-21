package com.project.planner.model;

public class DayRouteDto {
	private int p_id;
	private String dr_date;
	private int dr_order;
	private String dr_location;
	private double dr_lat;
	private double dr_lng;
	private int g_id;

	public double getDr_lat() {
		return dr_lat;
	}

	public void setDr_lat(double dr_lat) {
		this.dr_lat = dr_lat;
	}

	public double getDr_lng() {
		return dr_lng;
	}

	public void setDr_lng(double dr_lng) {
		this.dr_lng = dr_lng;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getDr_date() {
		return dr_date;
	}

	public void setDr_date(String dr_date) {
		this.dr_date = dr_date;
	}

	public int getDr_order() {
		return dr_order;
	}

	public void setDr_order(int dr_order) {
		this.dr_order = dr_order;
	}

	public String getDr_location() {
		return dr_location;
	}

	public void setDr_location(String dr_location) {
		this.dr_location = dr_location;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

}
