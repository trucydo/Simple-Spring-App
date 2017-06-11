package com.btspring.users.dao;

import com.btspring.users.model.User;

public interface UserDao {

	User findByUserName(String username);

}