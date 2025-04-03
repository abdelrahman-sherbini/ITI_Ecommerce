package gov.iti.Dtos;

public class AuthToken {
    private int userId;
    private String selector;
    private String validator;
    public AuthToken(int userId, String selector, String validator) {
        this.userId = userId;
        this.selector = selector;
        this.validator = validator;
    }
    public AuthToken() {
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getSelector() {
        return selector;
    }
    public void setSelector(String selector) {
        this.selector = selector;
    }
    public String getValidator() {
        return validator;
    }
    public void setValidator(String validator) {
        this.validator = validator;
    }
    
}
