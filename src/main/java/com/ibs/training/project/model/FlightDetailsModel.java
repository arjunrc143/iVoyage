package com.ibs.training.project.model;

public class FlightDetailsModel {

	private String flightId,airlineId,airlineName,fromLocation,toLocation,departureTime,arrivalTime;
	private int totalSeatEconomy,totalSeatBusiness,baggageLimit,priceEconomy,priceBusiness;
	public String getFlightId() {
		return flightId;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}
	public int getPriceEconomy() {
		return priceEconomy;
	}
	public void setPriceEconomy(int priceEconomy) {
		this.priceEconomy = priceEconomy;
	}
	public int getPriceBusiness() {
		return priceBusiness;
	}
	public void setPriceBusiness(int priceBusiness) {
		this.priceBusiness = priceBusiness;
	}
	public String getAirlineId() {
		return airlineId;
	}
	public void setAirlineId(String airlineId) {
		this.airlineId = airlineId;
	}
	public String getAirlineName() {
		return airlineName;
	}
	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}
	public String getFromLocation() {
		return fromLocation;
	}
	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}
	public String getToLocation() {
		return toLocation;
	}
	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public int getTotalSeatEconomy() {
		return totalSeatEconomy;
	}
	public void setTotalSeatEconomy(int totalSeatEconomy) {
		this.totalSeatEconomy = totalSeatEconomy;
	}
	public int getTotalSeatBusiness() {
		return totalSeatBusiness;
	}
	public void setTotalSeatBusiness(int totalSeatBusiness) {
		this.totalSeatBusiness = totalSeatBusiness;
	}
	public int getBaggageLimit() {
		return baggageLimit;
	}
	public void setBaggageLimit(int baggageLimit) {
		this.baggageLimit = baggageLimit;
	}


}
