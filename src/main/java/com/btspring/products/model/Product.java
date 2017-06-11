package com.btspring.products.model;

public class Product {
	private int id;
	private String name;
	private String category;
	private String price;
	private String description;
	private boolean isSelected;
		


	public Product() {
	}

	public Product(int id, String name, String category, String price, String description) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.description = description;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isSelected() {
		return isSelected;
	}

	public void setSelected(boolean isSelected) {
		this.isSelected = isSelected;
	}
}

