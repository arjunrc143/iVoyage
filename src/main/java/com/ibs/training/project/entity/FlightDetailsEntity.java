package com.ibs.training.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="FLIGHT_DETAILS")
public class FlightDetailsEntity {


	private String flightId,airlineId,airlineName,fromLocation,toLocation,departureTime,arrivalTime;
	private int totalSeatEconomy,totalSeatBusiness,baggageLimit,priceEconomy,priceBusiness;

	@Column(name="PRICE_ECONOMY",length=10)
	public int getPriceEconomy() {
		return priceEconomy;
	}
	public void setPriceEconomy(int priceEconomy) {
		this.priceEconomy = priceEconomy;
	}

	@Column(name="PRICE_BUSINESS",length=10)
	public int getPriceBusiness() {
		return priceBusiness;
	}
	public void setPriceBusiness(int priceBusiness) {
		this.priceBusiness = priceBusiness;
	}
	@Id
	@Column(name="FLIGHT_ID",length=10)
	public String getFlightId() {
		return flightId;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}

	@Column(name="AIRLINE_ID",length=10)
	public String getAirlineId() {
		return airlineId;
	}
	public void setAirlineId(String airlineId) {
		this.airlineId = airlineId;
	}

	@Column(name="AIRLINE_NAME",length=20)
	public String getAirlineName() {
		return airlineName;
	}
	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}

	@Column(name="FROM_LOCATION",length=20)
	public String getFromLocation() {
		return fromLocation;
	}
	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}

	@Column(name="TO_LOCATION",length=20)
	public String getToLocation() {
		return toLocation;
	}
	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}

	@Column(name="DEPARTURE_TIME",length=9)
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	@Column(name="ARRIVAL_TIME",length=9)
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	@Column(name="TOTAL_SEAT_ECONOMY",length=3)
	public int getTotalSeatEconomy() {
		return totalSeatEconomy;
	}
	public void setTotalSeatEconomy(int totalSeatEconomy) {
		this.totalSeatEconomy = totalSeatEconomy;
	}

	@Column(name="TOTAL_SEAT_BUSINESS",length=3)
	public int getTotalSeatBusiness() {
		return totalSeatBusiness;
	}
	public void setTotalSeatBusiness(int totalSeatBusiness) {
		this.totalSeatBusiness = totalSeatBusiness;
	}

	@Column(name="MAX_BAGGAGE_LIMIT",length=2)
	public int getBaggageLimit() {
		return baggageLimit;
	}
	public void setBaggageLimit(int baggageLimit) {
		this.baggageLimit = baggageLimit;
	}

}
