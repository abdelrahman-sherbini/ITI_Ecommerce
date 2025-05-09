package gov.iti.Dtos;

import java.sql.Timestamp;

public class Order {
	
	private int id;


	private String address;
	private String city;
	private String governorate;
	private int paymentId;
	private String status;
	private Timestamp date;
	private int userId;

	public Order() {
		super();
	}

	public Order(String address,String city,String governorate,int paymentId, String status, Timestamp date, int userId) {
		super();
		this.address = address;
		this.city = city;
		this.governorate = governorate;
		this.paymentId = paymentId;
		this.status = status;
		this.date = date;
		this.userId = userId;
	}

	public Order(int paymentId, String status, int userId) {
		super();
		this.paymentId =  paymentId;
		this.status = status;

		this.userId = userId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGovernorate() {
		return governorate;
	}

	public void setGovernorate(String governorate) {
		this.governorate = governorate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	
}
