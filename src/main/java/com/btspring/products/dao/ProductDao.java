package com.btspring.products.dao;

import java.util.List;

import com.btspring.products.model.Product;

public interface ProductDao {
	public void insertData(Product product);
	public List<Product> getProductList();
	public void updateData(Product product);
	public void deleteData(Integer id);
	public Product getProduct(Integer id);
	public void updateData(Integer id);

}
