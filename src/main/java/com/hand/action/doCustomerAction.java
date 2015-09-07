package com.hand.action;

import java.sql.Timestamp;
import java.util.Date;

import com.hand.Dao.CustomerDao;
import com.hand.POJO.Customer;
import com.opensymphony.xwork2.ActionSupport;

public class doCustomerAction extends ActionSupport {
	private String first_name;
	private String last_name;
	private String email;
	private int address_id;
	private int delet_id;
	public String add() throws Exception {
		CustomerDao customerDao = new CustomerDao();
		Date date = new Date();
		Timestamp time=new Timestamp (date.getTime());
		 Customer customer = new Customer();
		 customer.setFirst_name(first_name);
		 customer.setLast_name(last_name);
		 customer.setAddress_id(address_id);
		 customer.setEmail(email);
		 customer.setStore_id(1);
		 customer.setCreate_date(time);
		 customerDao.create(customer);
		 
		return SUCCESS;
	}
	
	public String delet() throws Exception {
		CustomerDao customerDao = new CustomerDao();
		customerDao.delete(delet_id);
		return SUCCESS;
	}
	public String update() throws Exception{
		CustomerDao customerDao = new CustomerDao();
		Customer customer = new Customer();
		System.out.println(delet_id);
		customerDao.update(delet_id,first_name,last_name,email,address_id);
		return SUCCESS;
	}
	
	
	
	
	public int getDelet_id() {
		return delet_id;
	}

	public void setDelet_id(int delet_id) {
		this.delet_id = delet_id;
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
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	
	
}
