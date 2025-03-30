package gov.iti.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import gov.iti.Dtos.OrderedProduct;

public class OrderedProductDao {
	private Connection con;

	public OrderedProductDao(Connection con) {
		super();
		this.con = con;
	}
	
	public void insertOrderedProduct(OrderedProduct ordProduct) {
		try {
			String query = "insert into ordered_product(product_id, quantity, price,  order_id) values( ?, ?, ?, ?)";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, ordProduct.getProduct_id());
			psmt.setInt(2, ordProduct.getQuantity());
			psmt.setBigDecimal(3,ordProduct.getPrice());
			psmt.setInt(4,ordProduct.getOrderId());


			psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List<OrderedProduct> getAllOrderedProduct(int oid){
		List<OrderedProduct> list = new ArrayList<OrderedProduct>();
		try {
			String query = "select * from ordered_product where order_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, oid);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				OrderedProduct orderProd = new OrderedProduct();
				orderProd.setId(rs.getInt("order_product_id"));
				orderProd.setPrice(rs.getBigDecimal("price"));
				orderProd.setQuantity(rs.getInt("quantity"));
				orderProd.setProduct_id(rs.getInt("product_id"));
				orderProd.setOrderId(oid);

				list.add(orderProd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean isOrdered(int pid){

		try {
			String query = "select * from ordered_product where product_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, pid);
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
