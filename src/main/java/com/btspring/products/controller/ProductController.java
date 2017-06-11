package com.btspring.products.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;  
import org.springframework.validation.BindingResult;  
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;  
import org.springframework.web.servlet.ModelAndView;

import com.btspring.products.dao.ProductDao;
import com.btspring.products.model.Product;
import com.btspring.users.dao.UserDao;
import com.btspring.users.dao.UserDaoImpl;
import com.btspring.users.model.User;  

@Controller  
@SessionAttributes  
public class ProductController {
	
	@Autowired
	ProductDao productDao;
	

	@RequestMapping(value = "/admin/product", method = RequestMethod.POST)  
    public ModelAndView insertProduct(@ModelAttribute("product") Product product) {
		productDao.insertData(product);
        System.out.println(product.getId().toString() + " " + product.getName().toString()+ " "
        		+ product.getCategory()+ " "+ product.getPrice()+ " "+ product.getDescription());
		return new ModelAndView("redirect:/admin/products");
    }
      
    @RequestMapping("/admin/product")  
    public ModelAndView showProduct() {  
        return new ModelAndView("product", "command", new Product());  
    }
  
    
    @RequestMapping(value ="/admin/products")
    public ModelAndView showProducts() {
    	List<Product> productList = productDao.getProductList();
    	System.out.println("controller");
    	for(int i = 0; i< productList.size(); ++i){
			System.out.println(productList.get(i).getId()+" "+productList.get(i).getName());
		}
    	
    	return new ModelAndView("list","productList",productList);
    }
    
    @RequestMapping(value="/admin/edit/id={id}")  
    public ModelAndView edit(@PathVariable int id){  
        Product product= productDao.getProduct(id);
        return new ModelAndView("editproduct","command",product);  
    } 
    
    @RequestMapping(value="/admin/edit/id={id}",method = RequestMethod.POST)  
    public ModelAndView editProduct(@ModelAttribute("product") Product product){  
        productDao.updateData(product);  
        System.out.println(product.getId().toString() + " " + product.getName().toString()+ " "
        		+ product.getCategory()+ " "+ product.getPrice()+ " "+ product.getDescription());
		return new ModelAndView("redirect:/admin/products");
    }
    
    @RequestMapping(value="/admin/delete/id={id}")  
    public ModelAndView delete(@PathVariable int id){  
        productDao.deleteData(id);  
        return new ModelAndView("redirect:/admin/products");  
    }
    
    @RequestMapping(value="/admin/deleteMany")  
    public ModelAndView deleteMany(@ModelAttribute("productList") List<Product> productList){  
    	for(int i = 0; i< productList.size(); ++i){
			System.out.println(productList.get(i).getId()+" "+productList.get(i).isSelected());
		}
    	
    	return new ModelAndView("list","productList",productList);
    }
    
    @RequestMapping(value ="/user/products")
    public ModelAndView showUserProducts() {
    	List<Product> productList = productDao.getProductList();
    	return new ModelAndView("userlist","productList",productList);
    }
    
    @RequestMapping(value ="/user/info")
    public ModelAndView showUserInfo() {
    	return new ModelAndView("userinfo");
    }
}
