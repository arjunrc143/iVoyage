package com.ibs.training.project.model;

import java.util.List;

public class BookingDetailsIncomingModel {

	private int nbs,nes;
	private String mobile;

	List<FlightDetailsModel> routeList;

	public int getNbs() {
		return nbs;
	}

	public void setNbs(int nbs) {
		this.nbs = nbs;
	}

	public int getNes() {
		return nes;
	}

	public void setNes(int nes) {
		this.nes = nes;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public List<FlightDetailsModel> getRouteList() {
		return routeList;
	}

	public void setRouteList(List<FlightDetailsModel> routeList) {
		this.routeList = routeList;
	}



}
