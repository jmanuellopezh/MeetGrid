package org.iesalixar.jmanuellopezh.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.iesalixar.jmanuellopezh.helper.RoleType;

@Entity
@Table(name="user")
public class User implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	private long user_id;
	
	@Basic(optional = false)
	private String email;  
	
	@Basic(optional = false)
	private String password; 
	
	@Basic(optional = false)
	private String name; 
	
	@Basic(optional = false)
    private Role role;
	
	private int age; 
	
	private String gender; 
	
	private String area; 
	
	private String pic;
	
	private String description;
	
	//tabla favoritos
	@OneToMany(mappedBy="user")  
	private Set <User> favorites;
	
	@ManyToOne
	@JoinColumn (name="user_id")
	User favorited;
	
	//tabla block
	@OneToMany(mappedBy="user")  
	private Set <User> blocks;
	
	@ManyToOne
	@JoinColumn (name="user_id")
	User blocked;
	
	//guardado de mensajes que se remiten al usuario
	
	@OneToMany(mappedBy="messages")  
	private Set <Message> misMensajes;

	public User(long user_id, String email, String password, String name, Role role, int age, String gender,
			String area, String pic, String description, Set<User> favorites, User favorited, Set<User> blocks,
			User blocked, Set<Message> misMensajes) {
		super();
		this.user_id = user_id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.role = role;
		this.age = age;
		this.gender = gender;
		this.area = area;
		this.pic = pic;
		this.description = description;
		this.favorites = favorites;
		this.favorited = favorited;
		this.blocks = blocks;
		this.blocked = blocked;
		this.misMensajes = misMensajes;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String email, String password, String name, Role role, int age, String gender,
			String area, String pic, String description, Set<User> favorites, User favorited, Set<User> blocks,
			User blocked, Set<Message> misMensajes) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.role = role;
		this.age = age;
		this.gender = gender;
		this.area = area;
		this.pic = pic;
		this.description = description;
		this.favorites = favorites;
		this.favorited = favorited;
		this.blocks = blocks;
		this.blocked = blocked;
		this.misMensajes = misMensajes;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<User> getFavorites() {
		return favorites;
	}

	public void setFavorites(Set<User> favorites) {
		this.favorites = favorites;
	}

	public User getFavorited() {
		return favorited;
	}

	public void setFavorited(User favorited) {
		this.favorited = favorited;
	}

	public Set<User> getBlocks() {
		return blocks;
	}

	public void setBlocks(Set<User> blocks) {
		this.blocks = blocks;
	}

	public User getBlocked() {
		return blocked;
	}

	public void setBlocked(User blocked) {
		this.blocked = blocked;
	}

	public Set<Message> getMisMensajes() {
		return misMensajes;
	}

	public void setMisMensajes(Set<Message> misMensajes) {
		this.misMensajes = misMensajes;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", email=" + email + ", password=" + password + ", name=" + name + ", role="
				+ role + ", age=" + age + ", gender=" + gender + ", area=" + area + ", pic=" + pic + ", description="
				+ description + ", favorites=" + favorites + ", favorited=" + favorited + ", blocks=" + blocks
				+ ", blocked=" + blocked + ", misMensajes=" + misMensajes + "]";
	}
	
	
	
	
	
}