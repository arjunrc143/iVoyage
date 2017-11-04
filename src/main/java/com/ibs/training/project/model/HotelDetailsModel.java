package com.ibs.training.project.model;

public class HotelDetailsModel {

	private String hotelId,hotelName,location;
	private int totalRoomsAc,totalRoomsNonAc,priceAc,priceNonAc;

	public int getPriceAc() {
		return priceAc;
	}
	public void setPriceAc(int priceAc) {
		this.priceAc = priceAc;
	}
	public int getPriceNonAc() {
		return priceNonAc;
	}
	public void setPriceNonAc(int priceNonAc) {
		this.priceNonAc = priceNonAc;
	}
	public String getHotelId() {
		return hotelId;
	}
	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getTotalRoomsAc() {
		return totalRoomsAc;
	}
	public void setTotalRoomsAc(int totalRoomsAc) {
		this.totalRoomsAc = totalRoomsAc;
	}
	public int getTotalRoomsNonAc() {
		return totalRoomsNonAc;
	}
	public void setTotalRoomsNonAc(int totalRoomsNonAc) {
		this.totalRoomsNonAc = totalRoomsNonAc;
	}

}
