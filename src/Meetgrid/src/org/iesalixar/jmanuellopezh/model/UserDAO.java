package org.iesalixar.jmanuellopezh.model;

import java.util.List;

public interface UserDAO {
	
	public boolean checkUser(String email, String password);
	public String checkRole(String email, String password);
	boolean checkExistingUser(String email);
	void create(String email, String password, String role, String name, String age, String gender, String area, String pic, String description);
	public String checkId(String email, String password);
	void update(String password, String name, String age, String gender, String area, String pic, String description,
			String id);
	void deleteBlock(String owner, String deleted);
	boolean checkExistingFavorite(String owner, String favorited);
	List<User> readByFilter(String gender, String area, String min, String max, String id);
	User readUserById(String id);
	void makeFavorite(String owner, String favorited);
	List<User> readFavorites(String owner);
	boolean checkExistingBlocked(String owner, String blocked);
	void block(String owner, String blocked);
	void deleteFavorite(String owner, String deleted);
	void deleteUser(String id);
	List<User> readBlocks(String owner);


}
