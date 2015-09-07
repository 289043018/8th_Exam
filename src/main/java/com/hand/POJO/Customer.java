package com.hand.POJO;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
//@Entity
//@Table(name="customer")
public class Customer{
//	@Id @GeneratedValue
//	@Column(name="customer_id")
	private int id;
	
//	@Column(name="first_name")
	private String first_name;
	
//	@Column(name="last_name")
	private String last_name;
	
//	@Column(name="email")
	private String email;
	
//	@Column(name="add_id")
	private int address_id;
	
	//	@Column(name="last_update")
	private Timestamp lastupdate;
	
	private int store_id;
	
	private Timestamp create_date;
	
public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	public Timestamp getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}

public int getAddress_id() {
		return address_id;
	}

	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}

	
	public Customer(){}
	
	public Customer(String fname,String lname,String eamil,int add_id,int store_id,Timestamp create_date ){
		this.first_name=fname;
		this.last_name=lname;
		this.email=eamil;
		this.address_id=add_id;
		this.store_id=store_id;
		this.create_date=create_date;
	}
	
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getLastupdate() {
		return lastupdate;
	}
	public void setLastupdate(Timestamp lastupdate) {
		this.lastupdate = lastupdate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
