package com.qsp;

public class Customer {
	
	private int id;
	private String name;
	private Long mobno;
	private String email;
	private String username;
	public Customer(int id, String name, Long mobno, String email, String username) {
		super();
		this.id = id;
		this.name = name;
		this.mobno = mobno;
		this.email = email;
		this.username = username;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getMobno() {
		return mobno;
	}
	public void setMobno(Long mobno) {
		this.mobno = mobno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String toString() {
		
		return id+" "+name+" "+mobno+" "+email+" "+username;
	}

}
