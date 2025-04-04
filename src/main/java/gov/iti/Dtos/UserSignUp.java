package gov.iti.Dtos;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Date;

public class UserSignUp {
    private String firstName;
    private String lastName;
    private LocalDate dob;
    private String gender;
    private String phone;
    private String password;
    private String job;
    private float credit;
    private String email;
    private Address address;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(String dobStr) {
   
        if (dobStr == null || dobStr.trim().isEmpty()) {
            this.dob = null;
        } else {
            try {
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dobStr);
                this.dob = new java.sql.Date( date.getTime()) .toLocalDate();
            } catch (DateTimeParseException e) {
                this.dob = null; // Or handle error accordingly
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = (gender == null || gender.trim().isEmpty()) ? null : gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
