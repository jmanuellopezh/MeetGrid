package org.iesalixar.jmanuellopezh.model;

public interface UserDAO {
	
	public boolean checkUser(String email, String password);
	public String checkRole(String email, String password);
	boolean checkExistingUser(String email);
	void create(String email, String password, String role, String name, String age, String gender, String area, String pic, String description);
	public String checkId(String email, String password);


}
