package gov.iti.Dtos;

import java.sql.Timestamp;
import java.time.LocalDate;

public class User {
	
	private int userId;
	private String userFirstName;
	private String userLastName;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String userPhone;
	private String userGender;
	private float credit;

	private LocalDate dob;
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

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
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


	public String getUserFirstName() {
		return userFirstName;
	}

	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}

    public float getCredit() {
        return credit;
    }

    public void setCredit(String creditStr) {
        if (creditStr == null || creditStr.trim().isEmpty()) {
            this.credit = 0.0f; // or leave it unset
        } else {
            try {
                this.credit = Float.parseFloat(creditStr);
            } catch (NumberFormatException e) {
                this.credit = 0.0f; // or handle error accordingly
            }
        }
    }

	public static UserDTOBuilder builder() {
		return new UserDTOBuilder();
	}
	public static class UserDTOBuilder {
		private int userId;
		private String userFirstName;
		private String userLastName;
		private String userEmail;
		private String userPhone;
		private String userGender;
		private Timestamp registerDate;
		private int defaultAddress;

		public UserDTOBuilder withFirstName(String userFirstName) {
			this.userFirstName = userFirstName;
			return this;
		}
		public UserDTOBuilder withLastName(String userLastName) {
			this.userLastName = userLastName;
			return this;
		}
		public UserDTOBuilder withUserPhone (String userPhone) {
			this.userPhone = userPhone;
			return this;
		}
		public UserDTOBuilder withUserEmail (String userEmail) {
			this.userEmail = userEmail;
			return this;
		}
		public UserDTOBuilder withUserGender (String userGender) {
			this.userGender = userGender;
			return this;
		}
		public UserDTOBuilder withRegisterDate (Timestamp registerDate) {
			this.registerDate = registerDate;
			return this;
		}
		public UserDTOBuilder withDefaultAddress (int defaultAddress) {
			this.defaultAddress = defaultAddress;
			return this;
		}
		public User build() {
			User user = new User();
			user.setUserId(this.userId);
			user.setUserFirstName(this.userFirstName);
			user.setUserLastName(this.userLastName);
			user.setUserName(this.userFirstName + " " + this.userLastName);
			user.setUserEmail(this.userEmail);
			user.setUserPhone(this.userPhone);
			user.setUserGender(this.userGender);
			user.setRegisterDate(this.registerDate);
			user.setDefaultAddress(this.defaultAddress);
			return user;
		}

	}
	
}
