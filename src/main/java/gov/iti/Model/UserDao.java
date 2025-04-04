package gov.iti.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import gov.iti.Dtos.User;
import gov.iti.Dtos.UserSignUp;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	public User saveUser(UserSignUp userSignUp) {
		User user = null;

    try {
        // Step 1: Insert user without default address
        String query = "INSERT INTO user(first_name, last_name, email, password, phone, gender, register_date, job, credit, dob) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, userSignUp.getFirstName());
        ps.setString(2, userSignUp.getLastName());
        ps.setString(3, userSignUp.getEmail());
        ps.setString(4, userSignUp.getPassword());
        ps.setString(5, userSignUp.getPhone());
        ps.setString(6, userSignUp.getGender() != null ? userSignUp.getGender().toString() : null);
        ps.setTimestamp(7, new java.sql.Timestamp(System.currentTimeMillis()));
        ps.setString(8, userSignUp.getJob());
        ps.setFloat(9, userSignUp.getCredit());

		// Set DOB
        if (userSignUp.getDob() != null) {
            ps.setDate(10, java.sql.Date.valueOf(userSignUp.getDob()));
        } else {
            ps.setNull(10, java.sql.Types.DATE);
        }

        int rows = ps.executeUpdate();
        if (rows == 0) return null;

        ResultSet rs = ps.getGeneratedKeys();
        
        if (rs.next()) {
            int userId = rs.getInt(1);
			// Step 2: Insert address
			AddressDao addressDao = new AddressDao(con);
			boolean addressInserted = addressDao.insertAddress(userSignUp.getAddress(), userId);
			if (!addressInserted) return null;
	
			// Step 3: Get the address ID
			int addressId = addressDao.getLastInsertedAddressId(userId); // You need this method in AddressDao
	
			// Step 4: Update user with default address
			String updateQuery = "UPDATE user SET default_address = ? WHERE user_id = ?";
			PreparedStatement psUpdate = con.prepareStatement(updateQuery);
			psUpdate.setInt(1, addressId);
			psUpdate.setInt(2, userId);
			psUpdate.executeUpdate();
	
	
			user = new User();
				user.setUserId(userId);
				user.setUserFirstName(userSignUp.getFirstName());
				user.setUserLastName(userSignUp.getLastName());
				user.setUserName(userSignUp.getFirstName() + " " + userSignUp.getLastName());
				user.setUserEmail(userSignUp.getEmail());
				user.setUserPassword(userSignUp.getPassword());
				user.setUserPhone(userSignUp.getPhone());
				user.setUserGender(userSignUp.getGender().toString());
				user.setJob(userSignUp.getJob());
				user.setDefaultAddress(addressId);
				user.setDob(userSignUp.getDob());
        }

        

        

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return user;
}


	public User getUserByEmailPassword(String userEmail, String userPassword) {
		User user = null;
		try {
			String query = "select *,CONCAT(first_name, ' ', last_name) AS name from user where email = ? and password = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, userEmail);
			psmt.setString(2, userPassword);

			ResultSet set = psmt.executeQuery();
			while (set.next()) {
				user = new User();

				user.setUserId(set.getInt("user_id"));
				user.setUserFirstName(set.getString("first_name"));
				user.setUserLastName(set.getString("last_name"));
				user.setUserName(set.getString("name"));
				user.setUserEmail(set.getString("email"));
				user.setUserPassword(set.getString("password"));
				user.setUserPhone(set.getString("phone"));
				user.setUserGender(set.getString("gender"));
				user.setRegisterDate(set.getTimestamp("register_date"));
				user.setJob(set.getString("job"));
				user.setDefaultAddress(set.getInt("default_address"));
				if (set.getDate("dob") != null) {
					user.setDob(set.getDate("dob").toLocalDate());
				} 

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}


	public User getUserByEmail(String userEmail) {
		User user = null;
		try {
			String query = "select * from user where email = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, userEmail);
			

			ResultSet set = psmt.executeQuery();
			while (set.next()) {
				user = new User();

				user.setUserId(set.getInt("user_id"));
				user.setUserFirstName(set.getString("first_name"));
				user.setUserLastName(set.getString("last_name"));
				user.setUserName(set.getString("first_name") + " "  + set.getString("last_name"));
				user.setUserEmail(set.getString("email"));
				user.setUserPassword(set.getString("password"));
				user.setUserPhone(set.getString("phone"));
				user.setUserGender(set.getString("gender"));
				user.setRegisterDate(set.getTimestamp("register_date"));
				user.setJob(set.getString("job"));
				user.setDefaultAddress(set.getInt("default_address"));
				if (set.getDate("dob") != null) {
					user.setDob(set.getDate("dob").toLocalDate());
				} 
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public List<User> getAllUser() {
		List<User> list = new ArrayList<User>();
		try {
			String query = "select *,CONCAT(first_name, ' ', last_name) AS name from user";
			Statement statement = this.con.createStatement();
			ResultSet set = statement.executeQuery(query);
			while (set.next()) {
				User user = new User();
				user.setUserId(set.getInt("user_id"));
				user.setUserName(set.getString("name"));
				user.setUserEmail(set.getString("email"));
				user.setUserPassword(set.getString("password"));
				user.setUserPhone(set.getString("phone"));
				user.setUserGender(set.getString("gender"));
				user.setRegisterDate(set.getTimestamp("register_date"));
				user.setJob(set.getString("job"));
				user.setDefaultAddress(set.getInt("default_address"));


				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public User getUserByID( int userId) {
		User user = null;
		try {
			String query = "select *,CONCAT(first_name, ' ', last_name) AS name from user where user_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, userId);

			ResultSet set = psmt.executeQuery();
			if (set.next()) {
				user = new User();
				user.setUserId(set.getInt("user_id"));
				user.setUserName(set.getString("name"));
				user.setUserEmail(set.getString("email"));
				user.setUserPassword(set.getString("password"));
				user.setUserPhone(set.getString("phone"));
				user.setUserGender(set.getString("gender"));
				user.setRegisterDate(set.getTimestamp("register_date"));
				user.setJob(set.getString("job"));
				user.setDefaultAddress(set.getInt("default_address"));


			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public void updateUserDefaultAddresss(User user) {
		try {
			String query = "update user set default_address = ? where user_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, user.getDefaultAddress());
			psmt.setInt(2, user.getUserId());

			psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateUserPasswordByEmail(String password, String mail) {
		try {
			String query = "update user set password = ? where email = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, password);
			psmt.setString(2, mail);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateUser(User user) {
		try {
			String query = "update user set name = ?, email = ?, phone = ?, gender = ?, default_address = ?, job = ? where user_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, user.getUserName());
			psmt.setString(2, user.getUserEmail());
			psmt.setString(3, user.getUserPhone());
			psmt.setString(4, user.getUserGender());
			if (user.getDefaultAddress() == 0) {
				psmt.setNull(5, java.sql.Types.INTEGER);
			} else {
				psmt.setInt(5, user.getDefaultAddress());
			}
			// psmt.setInt(5,user.getDefaultAddress());
			psmt.setString(6, user.getJob());
			psmt.setInt(7, user.getUserId());

			psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int userCount() {
		int count = 0;
		try {
			String query = "select count(*) from user";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}


	public String getUserName(int uid) {
		String name = "";
		try {
			String query = "select concat(first_name,' ',last_name) from user where user_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			rs.next();
			name = rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	public String getUserEmail(int uid) {
		String email = "";
		try {
			String query = "select email from user where user_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			rs.next();
			email = rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return email;
	}
	public String getUserPhone(int uid) {
		String phone = "";
		try {
			String query = "select phone from user where user_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			rs.next();
			phone = rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return phone;
	}
	public void deleteUser(int uid) {
		try {
			String query = "delete from user where user_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<String> getAllEmail() {
		List<String> list = new ArrayList<>();
		try {
			String query = "select email from user";
			Statement statement = this.con.createStatement();
			ResultSet set = statement.executeQuery(query);
			while (set.next()) {
				list.add(set.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<String> getAllPhoneNumbers() {
		List<String> list = new ArrayList<>();
		try {
			String query = "select phone from user";
			Statement statement = this.con.createStatement();
			ResultSet set = statement.executeQuery(query);
			while (set.next()) {
				list.add(set.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
