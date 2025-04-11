package gov.iti.Dtos;

public class UserSignIn {
    private String email;
    private String password;
    private String rememberMe;
    
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
    public String getRememberMe() {
        return rememberMe;
    }
    public boolean getRememberMeAsBoolean() {
        return "on".equalsIgnoreCase(rememberMe);
    }
    public void setRememberMe(String rememberMe) {
        this.rememberMe = rememberMe;
    }

    

}
