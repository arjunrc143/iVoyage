package com.ibs.training.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="HOTELS_BOOKING")
public class HotelBookingsEntity {

	@Id
	@GenericGenerator(name="increment",strategy="increment")
	@GeneratedValue(generator="increment",strategy=GenerationType.AUTO)
	@Column(name="SERIAL_NO",length=5)
	private int serialNo;

	@Column(name="BOOKING_ID",length=30)
	private String bookingId;

	@Column(name="CUSTOMER_ID",length=5)
	private int customerId;

	@Column(name="PRICE",length=5)
	private double price;

	@Column(name="HOTEL_ID",length=7)
	private String hotel_Id;



	public int getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}

	public String getBookingId() {
		return bookingId;
	}
	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	public String getHotel_Id() {
		return hotel_Id;
	}
	public void setHotel_Id(String hotel_Id) {
		this.hotel_Id = hotel_Id;
	}






}
