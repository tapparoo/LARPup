package com.skilldistillery.larpup.data;

import com.skilldistillery.larpup.entities.User;

public interface LarpUpDAO {
	
	User findUserById (int id);
	User findUserByEmail (String email);
	User addUser(User user);
	boolean updateUser(User user);

}
