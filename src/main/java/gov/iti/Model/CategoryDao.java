package gov.iti.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import gov.iti.Dtos.Category;

public class CategoryDao {
	private Connection con;

	public CategoryDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean saveCategory(Category category) {
		boolean flag = false;

		try {
			String query = "insert into category(name, image) values(?, ?)";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, category.getCategoryName());
			psmt.setString(2, category.getCategoryImage());

			psmt.executeUpdate();
			flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List<Category> getAllCategories() {

		List<Category> list = new ArrayList<>();
		try {

			String query = "select * from category";
			Statement statement = this.con.createStatement();

			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				Category category = new Category();
				category.setCategoryId(rs.getLong("category_id"));
				category.setCategoryName(rs.getString("name"));
				category.setCategoryImage(rs.getString("image"));

				list.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public Category getCategoryById(int category_id) {
		Category category = new Category();
		try {
			String query = "select * from category where category_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, category_id);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				category.setCategoryId(rs.getInt("category_id"));
				category.setCategoryName(rs.getString("name"));
				category.setCategoryImage(rs.getString("image"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}
	public String getCategoryName(int catId) {
		String category = "";
		try {
			String query = "select * from category where category_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, catId);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				category = rs.getString("name");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}
	
	public void updateCategory(Category cat) {
		try {
			String query = "update category set name=?, image=? where category_id=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, cat.getCategoryName());
			psmt.setString(2, cat.getCategoryImage());
			psmt.setLong(3, cat.getCategoryId());
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteCategory(int category_id) {
		try {
			String query = "delete from category where category_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, category_id);
			
			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int categoryCount() {
		int count = 0;
		try {
			String query = "select count(*) from category";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public Map<Long, Integer> getProductCountsByCategory() {
		Map<Long, Integer> counts = new HashMap<>();
		try {
			String query = "SELECT category_id, COUNT(*) AS product_count FROM product GROUP BY category_id";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				long categoryId = rs.getLong("category_id");
				int count = rs.getInt("product_count");
				counts.put(categoryId, count);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return counts;
	}
}
