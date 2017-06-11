package com.btspring.products.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.btspring.products.model.Product;

public class ProductMapper implements RowMapper<Product> {
	
	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		Product product = new Product();
		product.setId(rs.getInt("id"));
		product.setName(rs.getString("name"));
		product.setCategory(rs.getString("category"));
		product.setPrice(rs.getString("price"));
		product.setDescription(rs.getString("description"));
		return product;
	}
}
