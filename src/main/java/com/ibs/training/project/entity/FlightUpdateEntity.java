package com.ibs.training.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="FLIGHT_UPDATED")
public class FlightUpdateEntity {
	private int UpdateId;
	private String dates,FlightId;
	private int bookedEco,bookedBusi,availableEco,availableBusi;

	@Id
	@Column(name="UPDATE_ID",length=3)
	@GenericGenerator(name="increment",strategy="increment")
	@GeneratedValue(generator="increment",strategy=GenerationType.AUTO)
	public int getUpdateId() {
		return UpdateId;
	}
	public void setUpdateId(int updateId) {
		UpdateId = updateId;
	}
	@Column(name="DATES",length=13)
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	
	@Column(name="FLIGHT_ID",length=8)
	public String getFlightId() {
		return FlightId;
	}
	public void setFlightId(String flightId) {
		FlightId = flightId;
	}
	
	@Column(name="BOOKED_ECO",length=3)
	public int getBookedEco() {
		return bookedEco;
	}
	public void setBookedEco(int bookedEco) {
		this.bookedEco = bookedEco;
	}
	
	@Column(name="BOOKED_BUSI",length=3)
	public int getBookedBusi() {
		return bookedBusi;
	}
	public void setBookedBusi(int bookedBusi) {
		this.bookedBusi = bookedBusi;
	}
	@Column(name="AVAIL_ECO",length=5)
	public int getAvailableEco() {
		return availableEco;
	}
	public void setAvailableEco(int availableEco) {
		this.availableEco = availableEco;
	}
	
	@Column(name="AVAIL_BUSI",length=5)
	public int getAvailableBusi() {
		return availableBusi;
	}
	public void setAvailableBusi(int availableBusi) {
		this.availableBusi = availableBusi;
	}

}
