package gov.iti.Dtos;

public class Address {
    private int address_id;


    private int user_id;
    private String pin_code;
    private String addressDescription;
    private String governorate;
    private String city;
    private String type;


    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getPin_code() {
        return pin_code;
    }

    public void setPin_code(String pin_code) {
        this.pin_code = pin_code;
    }
    public String getAddressDescription() {
        return addressDescription;
    }
    public void setAddressDescription(String addressDescription) {
        this.addressDescription = addressDescription;
    }
    public String getGovernorate() {
        return governorate;
    }
    public void setGovernorate(String governorate) {
        this.governorate = governorate;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

}
