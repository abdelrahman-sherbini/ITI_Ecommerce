package gov.iti.Model;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import gov.iti.Dtos.Product;

public class ProductDao {
	private Connection con;

	public ProductDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean saveProduct(Product product) {
		boolean flag = false;
		try {
			String query = "insert into product(name, description, price, quantity, discount, image, category_id) values(?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, product.getProductName());
			psmt.setString(2, product.getProductDescription());
			psmt.setBigDecimal(3, product.getProductPrice());
			psmt.setInt(4, product.getProductQunatity());
			psmt.setInt(5, product.getProductDiscount());
			psmt.setString(6, product.getProductImages());
			psmt.setInt(7, product.getCategoryId());

			psmt.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public List<Product> getAllProducts() {
		List<Product> list = new ArrayList<Product>();
		try {
			String query = "select * from product";
			Statement statement = this.con.createStatement();

			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("name"));
				product.setProductDescription(rs.getString("description"));
				product.setProductPrice(rs.getBigDecimal("price"));
				product.setProductQunatity(rs.getInt("quantity"));
				product.setProductDiscount(rs.getInt("discount"));
				product.setProductImages(rs.getString("image"));
				product.setCategoryId(rs.getInt("category_id"));

				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Product> getAllProducts(int start, int limit) {
		List<Product> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM product LIMIT ? OFFSET ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, limit);
			psmt.setInt(2, start);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("name"));
				product.setProductDescription(rs.getString("description"));
				product.setProductPrice(rs.getBigDecimal("price"));
				product.setProductQunatity(rs.getInt("quantity"));
				product.setProductDiscount(rs.getInt("discount"));
				product.setProductImages(rs.getString("image"));
				product.setCategoryId(rs.getInt("category_id"));

				list.add(product);
			}
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	public List<Product> getAllProducts(int start, int limit, String sortBy) {
		List<Product> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM product ORDER BY " + sortBy + " LIMIT ? OFFSET ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, limit);
			psmt.setInt(2, start);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("name"));
				product.setProductDescription(rs.getString("description"));
				product.setProductPrice(rs.getBigDecimal("price"));
				product.setProductQunatity(rs.getInt("quantity"));
				product.setProductDiscount(rs.getInt("discount"));
				product.setProductImages(rs.getString("image"));
				product.setCategoryId(rs.getInt("category_id"));

				list.add(product);
			}
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	public List<Product> getAllLatestProducts() {
		List<Product> list = new ArrayList<Product>();
		try {
			String query = "select * from product order by product_id desc";
			Statement statement = this.con.createStatement();

			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("name"));
				product.setProductDescription(rs.getString("description"));
				product.setProductPrice(rs.getBigDecimal("price"));
				product.setProductQunatity(rs.getInt("quantity"));
				product.setProductDiscount(rs.getInt("discount"));
				product.setProductImages(rs.getString("image"));
				product.setCategoryId(rs.getInt("category_id"));

				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Product getProductsByProductId(int product_id) {
		Product product = new Product();
		try {
			String query = "select * from product where product_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, product_id);
			ResultSet rs = psmt.executeQuery();
			rs.next();

			product.setProductId(rs.getInt("product_id"));
			product.setProductName(rs.getString("name"));
			product.setProductDescription(rs.getString("description"));
			product.setProductPrice(rs.getBigDecimal("price"));
			product.setProductQunatity(rs.getInt("quantity"));
			product.setProductDiscount(rs.getInt("discount"));
			product.setProductImages(rs.getString("image"));
			product.setCategoryId(rs.getInt("category_id"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	public List<Product> getAllProductsByCategoryId(int catId) {
		List<Product> list = new ArrayList<Product>();
		try {
			String query = "select * from product where category_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, catId);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("name"));
				product.setProductDescription(rs.getString("description"));
				product.setProductPrice(rs.getBigDecimal("price"));
				product.setProductQunatity(rs.getInt("quantity"));
				product.setProductDiscount(rs.getInt("discount"));
				product.setProductImages(rs.getString("image"));
				product.setCategoryId(rs.getInt("category_id"));

				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Product> getAllProductsByCategoryId(int catId, int start, int limit) {
		List<Product> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM product WHERE category_id = ? LIMIT ? OFFSET ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, catId);
			psmt.setInt(2, limit);
			psmt.setInt(3, start);
			ResultSet rs = psmt.executeQuery();
			// ... (existing code to populate list)
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("name"));
				product.setProductDescription(rs.getString("description"));
				product.setProductPrice(rs.getBigDecimal("price"));
				product.setProductQunatity(rs.getInt("quantity"));
				product.setProductDiscount(rs.getInt("discount"));
				product.setProductImages(rs.getString("image"));
				product.setCategoryId(rs.getInt("category_id"));

				list.add(product);
			}
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	public List<Product> getAllProductsByCategoryId(int catId, int start, int limit, String sortBy) {
		List<Product> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM product WHERE category_id = ? ORDER BY " + sortBy + " LIMIT ? OFFSET ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, catId);
			psmt.setInt(2, limit);
			psmt.setInt(3, start);
			ResultSet rs = psmt.executeQuery();
			// ... existing population code
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("name"));
				product.setProductDescription(rs.getString("description"));
				product.setProductPrice(rs.getBigDecimal("price"));
				product.setProductQunatity(rs.getInt("quantity"));
				product.setProductDiscount(rs.getInt("discount"));
				product.setProductImages(rs.getString("image"));
				product.setCategoryId(rs.getInt("category_id"));

				list.add(product);
			}
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	public List<Product> getAllProductsBySearchKey(String search) {
		List<Product> list = new ArrayList<Product>();
		try {
			String query = "select * from product where lower(name) like ? or lower(description) like ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			search = "%" + search + "%";
			psmt.setString(1, search);
			psmt.setString(2, search);

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("name"));
				product.setProductDescription(rs.getString("description"));
				product.setProductPrice(rs.getBigDecimal("price"));
				product.setProductQunatity(rs.getInt("quantity"));
				product.setProductDiscount(rs.getInt("discount"));
				product.setProductImages(rs.getString("image"));
				product.setCategoryId(rs.getInt("category_id"));

				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Product> getDiscountedProducts() {
		List<Product> list = new ArrayList<Product>();
		try {
			String query = "select * from product where discount >= 30 order by discount desc";
			Statement statement = this.con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("name"));
				product.setProductDescription(rs.getString("description"));
				product.setProductPrice(rs.getBigDecimal("price"));
				product.setProductQunatity(rs.getInt("quantity"));
				product.setProductDiscount(rs.getInt("discount"));
				product.setProductImages(rs.getString("image"));
				product.setCategoryId(rs.getInt("category_id"));

				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void updateProduct(Product product) {
		try {

			String query = "update product set name=?, description=?, price=?, quantity=?, discount=?, image=?,category_id=? where product_id=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, product.getProductName());
			psmt.setString(2, product.getProductDescription());
			psmt.setBigDecimal(3, product.getProductPrice());
			psmt.setInt(4, product.getProductQunatity());
			psmt.setInt(5, product.getProductDiscount());
			psmt.setString(6, product.getProductImages());
			psmt.setInt(7, product.getCategoryId());
			psmt.setInt(8, product.getProductId());

			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void updateQuantity(int id, int qty) {
		try {
			String query = "update product set quantity = ? where product_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, qty);
			psmt.setInt(2, id);

			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteProduct(int product_id) {
		try {
			String query = "delete from product where product_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, product_id);
			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int productCount() {
		int count = 0;
		try {
			String query = "select count(*) from product";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public double getProductPriceById(int product_id) {
		double price = 0;
		try {
			String query = "select price, discount from product where product_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, product_id);
			ResultSet rs = psmt.executeQuery();
			rs.next();
			double orgPrice = rs.getInt(1);
			int discount = rs.getInt(2);

			double discountPrice = (int) ((discount / 100.0) * orgPrice);
			price = orgPrice - discountPrice;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return price;
	}
	public int getProductQuantityById(int product_id) {
		int qty = 0;
		try {
			String query = "select quantity from product where product_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, product_id);
			ResultSet rs = psmt.executeQuery();
			rs.next();
			qty = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qty;
	}


	public int getTotalProductCountByCategory(int catId) {
		int count = 0;
		try {
			String query = "SELECT COUNT(*) FROM product WHERE category_id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, catId);
			ResultSet rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) { e.printStackTrace(); }
		return count;
	}

	public List<Product> getAllProductsWithPriceRange(int start, int limit, String sortBy, BigDecimal minPrice, BigDecimal maxPrice) {
		List<Product> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM product WHERE price BETWEEN ? AND ? ORDER BY " + sortBy + " LIMIT ? OFFSET ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setBigDecimal(1, minPrice);
			psmt.setBigDecimal(2, maxPrice);
			psmt.setInt(3, limit);
			psmt.setInt(4, start);
			ResultSet rs = psmt.executeQuery();
			// ... (existing population code)
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	public int getProductCountWithPriceRange(BigDecimal minPrice, BigDecimal maxPrice) {
		int count = 0;
		try {
			String query = "SELECT COUNT(*) FROM product WHERE price BETWEEN ? AND ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setBigDecimal(1, minPrice);
			psmt.setBigDecimal(2, maxPrice);
			ResultSet rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) { e.printStackTrace(); }
		return count;
	}

	public List<Product> getAllProductsByCategoryIdWithPriceRange(int catId, int start, int limit, String sortBy, BigDecimal minPrice, BigDecimal maxPrice) {
		List<Product> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM product WHERE category_id = ? AND price BETWEEN ? AND ? ORDER BY " + sortBy + " LIMIT ? OFFSET ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, catId);
			psmt.setBigDecimal(2, minPrice);
			psmt.setBigDecimal(3, maxPrice);
			psmt.setInt(4, limit);
			psmt.setInt(5, start);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("name"));
				product.setProductDescription(rs.getString("description"));
				product.setProductPrice(rs.getBigDecimal("price"));
				product.setProductQunatity(rs.getInt("quantity"));
				product.setProductDiscount(rs.getInt("discount"));
				product.setProductImages(rs.getString("image"));
				product.setCategoryId(rs.getInt("category_id"));
				list.add(product);
			}
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}

	public int getProductCountByCategoryWithPriceRange(int catId, BigDecimal minPrice, BigDecimal maxPrice) {
		int count = 0;
		try {
			String query = "SELECT COUNT(*) FROM product WHERE category_id = ? AND price BETWEEN ? AND ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, catId);
			psmt.setBigDecimal(2, minPrice);
			psmt.setBigDecimal(3, maxPrice);
			ResultSet rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) { e.printStackTrace(); }
		return count;
	}



}
