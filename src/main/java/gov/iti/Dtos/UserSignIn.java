package gov.iti.Dtos;

public class UserSignIn {
    private String email;
    private String password;
    private boolean rememberMe;
    
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public boolean getRememberMe() {
        return rememberMe;
    }
    public boolean isRememberMe() {
        return rememberMe;
    }
    public void setRememberMeMe(String rememberMe) {
        this.rememberMe = Boolean.parseBoolean(rememberMe);
    }

    

}
