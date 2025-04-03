package gov.iti.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import gov.iti.Dtos.AuthToken;

public class AuthDao {
    private Connection con;

    public AuthDao(Connection con) {
        super();
        this.con = con;
    }

    public boolean saveAuth(AuthToken authToken) {
        boolean flag = false;

        try {
            String query = "insert into user_auth(selector, validator, user_id) values(?, ?, ?)";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setString(1, authToken.getSelector());
            psmt.setString(2, authToken.getValidator());
            psmt.setInt(3, authToken.getUserId());

            psmt.executeUpdate();
            flag = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public AuthToken findBySelector(String selector) {
        AuthToken authToken = null;
        try {
            String query = "SELECT * FROM user_auth WHERE selector = ?";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setString(1, selector);

            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
                authToken = new AuthToken();
                authToken.setSelector(rs.getString("selector"));
                authToken.setValidator(rs.getString("validator"));
                authToken.setUserId(rs.getInt("user_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return authToken;
    }

    public void update(AuthToken token) {
        try {
            String query = "UPDATE user_auth SET validator = ? WHERE selector = ?";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setString(1, token.getValidator());
            psmt.setString(2, token.getSelector());

            int rowsAffected = psmt.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("No records were updated.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int userId) {
        try {
            String query = "DELETE FROM user_auth WHERE user_id = ?";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setInt(1, userId);

            int rowsAffected = psmt.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("No records were deleted.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
