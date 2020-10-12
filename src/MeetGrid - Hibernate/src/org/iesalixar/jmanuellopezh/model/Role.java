package org.iesalixar.jmanuellopezh.model;

import javax.persistence.Basic;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.iesalixar.jmanuellopezh.helper.RoleType;

public class Role {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	private long role_id;
	
	private RoleType type;

	public Role(long role_id, RoleType type) {
		super();
		this.role_id = role_id;
		this.type = type;
	}

	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	public long getRole_id() {
		return role_id;
	}

	public void setRole_id(long role_id) {
		this.role_id = role_id;
	}

	public RoleType getType() {
		return type;
	}

	public void setType(RoleType type) {
		this.type = type;
	}
	
	
	

}
