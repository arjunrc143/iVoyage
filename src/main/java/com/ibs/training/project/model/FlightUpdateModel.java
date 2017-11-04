package com.ibs.training.project.model;

public class FlightUpdateModel {
private String dates,FlightId;
private int bookedEco,bookedBusi,availableEco,availableBusi;
public String getDates() {
	return dates;
}
public void setDates(String dates) {
	this.dates = dates;
}
public String getFlightId() {
	return FlightId;
}
public void setFlightId(String flightId) {
	FlightId = flightId;
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
public int getAvailableEco() {
	return availableEco;
}
public void setAvailableEco(int availableEco) {
	this.availableEco = availableEco;
}
public int getAvailableBusi() {
	return availableBusi;
}
public void setAvailableBusi(int availableBusi) {
	this.availableBusi = availableBusi;
}

}
