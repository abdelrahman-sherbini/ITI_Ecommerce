package gov.iti.Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import gov.iti.Dtos.Order;

public class OrderDao {
	
	private Connection con;
	public OrderDao(Connection con) {
		super();
		this.con = con;
	}
	
	public int insertOrder(Order order) {
		int id = 0;
		try {
			String query = "insert into `order`(payment_id, user_id,address,city,country, status, date) values(?,?,?,?, ?, ?, ?)";
			PreparedStatement psmt = this.con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			
			psmt.setInt(1, order.getPaymentId());
			psmt.setInt(2, order.getUserId());
			psmt.setString(3, order.getAddress());
			psmt.setString(4, order.getCity());
			psmt.setInt(5, order.getCountry());
			psmt.setString(6, order.getStatus());
			if (order.getDate() != null) {

			psmt.setTimestamp(7, order.getDate());
			}else{
				psmt.setTimestamp(7,new Timestamp(System.currentTimeMillis()));
			}

			int affectedRows = psmt.executeUpdate();

	        if (affectedRows == 0) {
	            throw new SQLException("Insertion failed, no rows affected.");
	        }
	        try (ResultSet generatedKeys = psmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                id = generatedKeys.getInt(1);
	            }
	            else {
	                throw new SQLException("Insertion failed, no ID obtained.");
	            }
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	public List<Order> getAllOrderByUserId(int uid){
		List<Order> list = new ArrayList<Order>();
		try {
			String query = "select * from `order` where user_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt("order_id"));
				order.setStatus(rs.getString("status"));
				order.setDate(rs.getTimestamp("date"));
				order.setPaymentId(rs.getInt("payment_id"));
				order.setAddress(rs.getString("address"));
				order.setCity(rs.getString("city"));
				order.setCountry(rs.getInt("country"));
				order.setUserId(uid);

				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Order getOrderById(int id){
		Order order = new Order();
		try {
			String query = "select * from `order` where order_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, id);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				order.setId(rs.getInt("order_id"));
				order.setStatus(rs.getString("status"));
				order.setDate(rs.getTimestamp("date"));
				order.setPaymentId(rs.getInt("payment_id"));
				order.setUserId(rs.getInt("user_id"));
				order.setAddress(rs.getString("address"));
				order.setCity(rs.getString("city"));
				order.setCountry(rs.getInt("country"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return order;
	}
	public List<Order> getAllOrder(){
		List<Order> list = new ArrayList<Order>();
		try {
			String query = "select * from `order`";
			Statement statement = this.con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt("order_id"));
				order.setStatus(rs.getString("status"));
				order.setDate(rs.getTimestamp("date"));
				order.setPaymentId(rs.getInt("payment_id"));
				order.setUserId(rs.getInt("user_id"));
				order.setAddress(rs.getString("address"));
				order.setCity(rs.getString("city"));
				order.setCountry(rs.getInt("country"));
				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void updateOrderStatus(int oid, String status) {
		try {
			String query = "update `order` set status = ? where order_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, status);
			psmt.setInt(2, oid);

			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
