package gov.iti.Services;

import java.util.List;

import gov.iti.Dtos.UserSignUp;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Helper.PasswordHasher;
import gov.iti.Model.UserDao;

public class UserService {
     private final UserDao dao;

    public UserService() {
        this.dao = new UserDao(ConnectionProvider.getConnection());
    }

    public int SignUp(UserSignUp dto){
        // hash password
        dto.setPassword(PasswordHasher.hashPassword(dto.getPassword()));
        return dao.saveUser(dto);
    }

    public boolean ValidateEmail(String email){
        List<String> allEmails = dao.getAllEmail();
        return allEmails.contains(email);
    }

    public boolean ValidatePhone(String phone){
        List<String> allPhoneNumbers = dao.getAllPhoneNumbers();
        return allPhoneNumbers.contains(phone);
    }
    
    
}
