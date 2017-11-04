package com.ibs.training.project.model;

import java.util.List;

public class FlightUpdateListModel {
private String departureDate;
private int bookedEco,bookedBusi;
private List<FlightDetailsModel> routes;
public String getDepartureDate() {
	return departureDate;
}
public void setDepartureDate(String departureDate) {
	this.departureDate = departureDate;
}
public List<FlightDetailsModel> getRoutes() {
	return routes;
}
public void setRoutes(List<FlightDetailsModel> routes) {
	this.routes = routes;
}
public int getBookedEco() {
	return bookedEco;
}
public void setBookedEco(int bookedEco) {
	this.bookedEco = bookedEco;
}
public int getBookedBusi() {
	return bookedBusi;
}
public void setBookedBusi(int bookedBusi) {
	this.bookedBusi = bookedBusi;
}

}
