package com.ibs.training.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="HOTEL_DETAILS")
public class HotelDetailsEntity {
	private String hotelId,hotelName,location;
	private int totalRoomsAc,totalRoomsNonAc;
	
	@Id
	@Column(name="HOTEL_ID",length=5)
	public String getHotelId() {
		return hotelId;
	}
	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}
	
	@Column(name="HOTEL_NAME",length=15)
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	
	@Column(name="LOCATION",length=15)
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	@Column(name="TOTAL_ROOMS_AC",length=3)
	public int getTotalRoomsAc() {
		return totalRoomsAc;
	}
	public void setTotalRoomsAc(int totalRoomsAc) {
		this.totalRoomsAc = totalRoomsAc;
	}
	
	@Column(name="TOTAL_ROOMS_NONAC",length=3)
	public int getTotalRoomsNonAc() {
		return totalRoomsNonAc;
	}
	public void setTotalRoomsNonAc(int totalRoomsNonAc) {
		this.totalRoomsNonAc = totalRoomsNonAc;
	}
	
}
