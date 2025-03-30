package gov.iti.Dtos;

import java.math.BigDecimal;

public class OrderedProduct {
	
	private int id;


	private BigDecimal price;
	private int product_id;
	private int quantity;
	private int orderId;

	public OrderedProduct() {
		super();
	}

	public OrderedProduct(int product_id, BigDecimal price, int quantity, int orderId) {
		super();
		this.price = price;
		this.product_id = product_id;
		this.quantity = quantity;
		this.orderId = orderId;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
}
