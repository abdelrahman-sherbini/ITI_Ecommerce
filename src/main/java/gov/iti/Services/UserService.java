package gov.iti.Services;

import java.sql.Connection;
import java.util.List;

import gov.iti.Dtos.AuthToken;
import gov.iti.Dtos.User;
import gov.iti.Dtos.UserSignIn;
import gov.iti.Dtos.UserSignUp;
import gov.iti.Helper.ConnectionProvider;
import gov.iti.Helper.PasswordHasher;
import gov.iti.Model.AuthDao;
import gov.iti.Model.UserDao;

public class UserService {
     private final UserDao dao;
     private final AuthDao authDao;

    public UserService() {
        this.dao = new UserDao(ConnectionProvider.getConnection());
        this.authDao = new AuthDao(ConnectionProvider.getConnection());
        
    }

    public User signUp(UserSignUp dto){
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

    public boolean ValidatePhoneExcept(String phone,int uid){
        List<String> allPhoneNumbers = dao.getAllPhoneNumbersExcept(uid);
        return allPhoneNumbers.contains(phone);
    }

    public User logIn(UserSignIn userSignIn){
       User user = dao.getUserByEmail(userSignIn.getEmail());
       
       if(user != null){
        boolean verify =PasswordHasher.verifyPassword(userSignIn.getPassword(), user.getUserPassword());
        System.out.println(verify);
        if(verify){
            return user;
        }else{
            return null;
        }
       }else{
        return null;
       }
       
        
    }

    public boolean generateAuthToken(AuthToken authToken){
        return authDao.saveAuth(authToken);
    }
    
    
}
