package gov.iti.Dtos;

public class Category {

	private long categoryId;
	private String categoryName;
	private String categoryImage;
	
	public Category() {
		super();
	}
	
	public Category(int categoryId, String categoryName, String categoryImage) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryImage = categoryImage;
	}

	public Category(String categoryName, String categoryImage) {
		super();
		this.categoryName = categoryName;
		this.categoryImage = categoryImage;
	}

	public long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryImage() {
		return categoryImage;
	}

	public void setCategoryImage(String categoryImage) {
		this.categoryImage = categoryImage;
	}

}
