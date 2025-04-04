package gov.iti.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import gov.iti.Dtos.Address;
import gov.iti.Dtos.User;

public class AddressDao {

    private Connection con;

    public AddressDao(Connection con) {
        this.con = con;
    }

    // Insert new address for a user
    public boolean insertAddress(Address address, long userId) {
        boolean flag = false;
        try {
            String query = "INSERT INTO user_address(user_id, address, governorate, city, type, pin_code) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, userId);
            ps.setString(2, address.getAddressDescription());
            ps.setString(3, address.getGovernorate());
            ps.setString(4, address.getCity());
            ps.setString(5, address.getType());
            ps.setString(6, null); // Optional pin code if needed

            int rows = ps.executeUpdate();
            flag = rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    // Get the latest address inserted for the user
    public int getLastInsertedAddressId(long userId) {
        int addressId = -1;
        try {
            String query = "SELECT address_id FROM user_address WHERE user_id = ? ORDER BY address_id DESC LIMIT 1";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                addressId = rs.getInt("address_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addressId;
    }

    //Get all adresses for a user
    public List<Address> getAllAddressList(long userId) {
        		List<Address> list = new ArrayList<Address>();
		try {
			String query = "SELECT * FROM user_address WHERE user_id = ?";
			PreparedStatement statement = con.prepareStatement(query);
            statement.setLong(1, userId);
			ResultSet set = statement.executeQuery();
			while (set.next()) {
				Address address = new Address();
                address.setAddress_id(set.getInt("address_id"));
                address.setUser_id(set.getInt("user_id"));
                address.setPin_code(set.getString("pin_code"));
                address.setAddressDescription(set.getString("address"));
                address.setGovernorate(set.getString("governorate"));
                address.setCity(set.getString("city"));
                address.setType(set.getString("type"));

				list.add(address);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

    }

    // Retrieve an address by address ID
    public Address getAddressById(long addressId) {
        Address address = null;
        try {
            String query = "SELECT * FROM user_address WHERE address_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, addressId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                address = new Address();
                address.setAddressDescription(rs.getString("address"));
                address.setGovernorate(rs.getString("governorate"));
                address.setCity(rs.getString("city"));
                address.setType(rs.getString("type"));
                // You can also add pin_code if needed
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return address;
    }

    // Optional: Delete address
    public boolean deleteAddressById(long addressId) {
        boolean flag = false;
        try {
            String query = "DELETE FROM user_address WHERE address_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, addressId);
            int rows = ps.executeUpdate();
            flag = rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    // Optional: Update address
    public boolean updateAddress(long addressId, Address address) {
        boolean flag = false;
        try {
            String query = "UPDATE user_address SET address = ?, governorate = ?, city = ?, type = ?, pin_code = ? WHERE address_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, address.getAddressDescription());
            ps.setString(2, address.getGovernorate());
            ps.setString(3, address.getCity());
            ps.setString(4, address.getType());
            ps.setString(5, null); // Or set pin_code if you decide to support it
            ps.setLong(6, addressId);

            flag = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    // Check if addressid belongs to userid
    public boolean checkAddress(int addressId,int userId) {
        boolean flag = false;

        try {
            String query = "SELECT * FROM user_address WHERE address_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, addressId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                if (userId == rs.getInt("user_id")) {
                    flag = true;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
