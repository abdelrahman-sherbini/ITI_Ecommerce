package gov.iti.Dtos;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class Product {

	private int productId;
    private String productName;
    private String productDescription;
    private BigDecimal  productPrice;
    private int productDiscount;
    private int productQunatity;
    private String productImages;
    private int categoryId;
    
	public Product() {
		super();
	}
	
	public Product(int productId, String productName, String productDescription, BigDecimal  productPrice,
			int productDiscount, int productQunatity, String productImages, int categoryId) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQunatity = productQunatity;
		this.productImages = productImages;
		this.categoryId = categoryId;
	}

	public Product(String productName, String productDescription, BigDecimal  productPrice, int productDiscount,
			int productQunatity, String productImages) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQunatity = productQunatity;
		this.productImages = productImages;
	}

	public Product(String productName, String productDescription, BigDecimal  productPrice, int productDiscount,
			int productQunatity, String productImages, int categoryId) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQunatity = productQunatity;
		this.productImages = productImages;
		this.categoryId = categoryId;
	}
	
	public Product(int productId, String productName, BigDecimal  productPrice, int productDiscount, int productQunatity) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQunatity = productQunatity;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public BigDecimal  getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(BigDecimal  productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getProductQunatity() {
		return productQunatity;
	}

	public void setProductQunatity(int productQunatity) {
		this.productQunatity = productQunatity;
	}

	public String getProductImages() {
		return productImages;
	}

	public void setProductImages(String productImages) {
		this.productImages = productImages;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	//calculate price of product by applying discount
	public BigDecimal getProductPriceAfterDiscount() {
		BigDecimal discountPercentage = BigDecimal.valueOf(this.getProductDiscount()).divide(BigDecimal.valueOf(100));
		BigDecimal discountAmount = this.getProductPrice().multiply(discountPercentage).setScale(2, RoundingMode.HALF_UP);
		return this.getProductPrice().subtract(discountAmount);
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productPrice=" + productPrice + ", productDiscount=" + productDiscount
				+ ", productQunatity=" + productQunatity + ", productImages=" + productImages + ", categoryId="
				+ categoryId + "]";
	}
    
    
}
