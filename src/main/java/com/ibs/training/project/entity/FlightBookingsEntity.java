package com.ibs.training.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;



@Entity
@Table(name="FLIGHTS_BOOKING")
public class FlightBookingsEntity {

	private int serialNo,customerId,price;
	private String flightId,bookingId;


	@Column(name="CUSTOMER_ID",length=5)
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	@Column(name="BOOKING_ID",length=10)
	public String getBookingId() {
		return bookingId;
	}

	@Id
	@Column(name="SERIALNO",length=5)
	@GenericGenerator(name="increment",strategy="increment")
	@GeneratedValue(generator="increment",strategy=GenerationType.AUTO)
	public int getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	@Column(name="PRICE",length=5)
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	@Column(name="FLIGHT_ID",length=10)
	public String getFlightId() {
		return flightId;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}

}
