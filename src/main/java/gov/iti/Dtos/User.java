package gov.iti.Dtos;

import java.sql.Timestamp;

public class User {
	
	private int userId;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String userPhone;
	private String userGender;


	private Timestamp registerDate;
	private String job;
	private int defaultAddress;

	public User() {

	}

	public User(String userName, String userEmail, String userPassword, String userPhone, String userGender) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userGender = userGender;

	}

	public User(String userName, String userEmail, String userPassword, String userPhone, String userGender,
			Timestamp registerDate, int defaultAddress) {
		super();
		this.defaultAddress = defaultAddress;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userGender = userGender;
		this.registerDate = registerDate;

	}

	public User(String userName, String userEmail, String userPhone, String userGender) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userGender = userGender;

	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getDefaultAddress() {
		return defaultAddress;
	}

	public void setDefaultAddress(int defaultAddress) {
		this.defaultAddress = defaultAddress;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Timestamp getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}
	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}


	
}
