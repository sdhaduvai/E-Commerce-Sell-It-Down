package com.hemanshu;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="item")
public class Item {
 
	@Id
	public int id;
	private int seller_id;
	private String category;
	private String cost_price;
	public String product_name;
	private int quantity;
	private String selling_price;
	private boolean status;
	public String description;
	private String image_path;

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public int getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}

	public String getcategory() {
		return category;
	}

	public void setcategory(String category) {
		this.category = category;
	}

	public String getCost_price() {
		return cost_price;
	}

	public void setCost_price(String cost_price) {
		this.cost_price = cost_price;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getSelling_price() {
		return selling_price;
	}

	public void setSelling_price(String selling_price) {
		this.selling_price = selling_price;
	}

	public boolean getstatus() {
		return status;
	}

	public void setstatus(boolean status) {
		this.status = status;
	}

	public String getdescription() {
		return description;
	}

	public void setdescription(String description) {
		this.description = description;
	}

	public String getimage_path() {
		return image_path;
	}

	public void setimage_path(String image_path) {
		this.image_path = image_path;
	}
}