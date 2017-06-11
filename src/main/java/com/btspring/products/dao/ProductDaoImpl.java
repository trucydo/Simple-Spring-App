package com.btspring.products.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.btspring.products.model.Product;

@Component
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	DataSource dataSource;

	public DataSource getDataSource(){
		return dataSource;
	}
	public void setDataSource (DataSource dataSource){
		this.dataSource = dataSource;
	}
	@Override
	public void insertData(Product product) {
		String sql = "INSERT INTO products "
				+"(name,category,price,description) VALUES (?, ?, ?, ?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		jdbcTemplate.update(sql,new Object[]{product.getName(),product.getCategory(),
				product.getPrice(), product.getDescription()});
	}

	@Override
	public List<Product> getProductList() {
		List<Product> productList = new ArrayList<Product>();
		
		String sql = "select * from products";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		productList = jdbcTemplate.query(sql,new ProductMapper());
		
		for(int i = 0; i< productList.size(); ++i){
			System.out.println(productList.get(i).getId()+" "+productList.get(i).getName());
		}
		return productList;
	}
	
	@Override
	public void updateData(Product product) {
		String sql = "update products set name = ?, category = ?, price = ?, description = ? where id = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql, product.getName(), product.getCategory(), product.getPrice(),
				product.getDescription(), product.getId());
		System.out.println("Update record with id: "+ product.getId().toString());
	}
	
	@Override
	public void updateData(Integer id) {
		Product product = getProduct(id);
		String sql = "update products set name = ?, category = ?, price = ?, description = ? where id = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql, product.getName(), product.getCategory(), product.getPrice(),
				product.getDescription(), product.getId());
		System.out.println("Update record with id: "+ product.getId().toString());
	}

	@Override
	public void deleteData(Integer id) {
		String sql = "delete from products where id =?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql,id);
	}

	@Override
	public Product getProduct(Integer id) {
		String sql = "select * from products where id=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		Product product = jdbcTemplate.queryForObject(sql,new Object[]{id},new ProductMapper());
		return product;
	}
	
}
