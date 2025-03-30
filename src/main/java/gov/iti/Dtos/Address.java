package gov.iti.Dtos;

public class Address {
    private String addressDescription;
    private String governorate;
    private String city;
    private String type;
    
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
