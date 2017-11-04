package com.ibs.training.project.model;

public class HotelUpdateModel {
private String date,hotelId;
private int noOfDays,availableAC,availableNonAC,bookedAC,bookedNonAC;

public int getBookedAC() {
	return bookedAC;
}
public void setBookedAC(int bookedAC) {
	this.bookedAC = bookedAC;
}
public int getBookedNonAC() {
	return bookedNonAC;
}
public void setBookedNonAC(int bookedNonAC) {
	this.bookedNonAC = bookedNonAC;
}
public String getHotelId() {
	return hotelId;
}
public void setHotelId(String hotelId) {
	this.hotelId = hotelId;
}
public int getNoOfDays() {
	return noOfDays;
}
public void setNoOfDays(int noOfDays) {
	this.noOfDays = noOfDays;
}
public int getAvailableAC() {
	return availableAC;
}
public void setAvailableAC(int availableAC) {
	this.availableAC = availableAC;
}
public int getAvailableNonAC() {
	return availableNonAC;
}
public void setAvailableNonAC(int availableNonAC) {
	this.availableNonAC = availableNonAC;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}


}
