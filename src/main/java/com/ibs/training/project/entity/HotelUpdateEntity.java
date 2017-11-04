package com.ibs.training.project.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="HOTEL_UPDATED")
public class HotelUpdateEntity {
	
	private int updateId,bookedAC,bookedNonAC;

	private String hotelId,date;
	private int noOfDays,availableAC,availableNonAC;

	@Id
	@Column(name="UPDATE_ID",length=3)
	@GenericGenerator(name="increment",strategy="increment")
	@GeneratedValue(generator="increment",strategy=GenerationType.AUTO)
	public int getUpdateId() {
		return updateId;
	}
	public void setUpdateId(int updateId) {
		this.updateId = updateId;
	}
	@Column(name="HOTEL_ID",length=5)
	public String getHotelId() {
		return hotelId;
	}
	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}
@Column(name="DATES",length=15)
	
	public String getDate() {
		return date;
	}
	
	
	public void setDate(String date) {
		this.date = date;
	}
	
	@Column(name="BOOKED_AC",length=3)
	public int getBookedAC() {
		return bookedAC;
	}
	public void setBookedAC(int bookedAC) {
		this.bookedAC = bookedAC;
	}
	@Column(name="BOOKED_NonAC",length=3)
	public int getBookedNonAC() {
		return bookedNonAC;
	}
	
	public void setBookedNonAC(int bookedNonAC) {
		this.bookedNonAC = bookedNonAC;
	}
	
	@Column(name="AVAIL_AC",length=3)
	public int getAvailableAC() {
		return availableAC;
	}
	
	public void setAvailableAC(int availableAC) {
		this.availableAC = availableAC;
	}
	
	@Column(name="AVAIL_NONAC",length=3)
	public int getAvailableNonAC() {
		return availableNonAC;
	}
	public void setAvailableNonAC(int availableNonAC) {
		this.availableNonAC = availableNonAC;
	}
	
		
	@Column(name="DAYS",length=3)
	public int getNoOfDays() {
		return noOfDays;
	}
	public void setNoOfDays(int noOfDays) {
		this.noOfDays = noOfDays;
	}
	
	
}
