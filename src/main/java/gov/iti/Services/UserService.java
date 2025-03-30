package gov.iti.Services;

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
    
    
}
