package com.hand.Dao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.util.Iterator;  
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;  
import org.hibernate.Session;  
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import com.hand.POJO.Customer;
import com.hand.POJO.Payment;
import com.hand.POJO.Rental;
import com.hand.util.HibernateUtil;
import com.opensymphony.xwork2.Result;  
public class CustomerDao {
	 private Session session;  
	    private Transaction tx;  
	    
	    public CustomerDao(){
	    	session = HibernateUtil.getSession();  
	    }
	    
	    
	    /*  
	     * 将User对象插入到数据库中  
	     * @param user  
	     */  
	    public void create(Customer customer) {  
	        try {  
	            tx = session.beginTransaction();  
	            session.save(customer);
	            System.out.println("插入了一个用户");
	            tx.commit();  
	        } catch (HibernateException e) { 
	        	System.out.println("事务回滚了");
	            HibernateUtil.rollback(tx);  
	        } finally {  
	            HibernateUtil.closeSession();  
	        }  
	    }  
	      
	    public void delete(int customer_id) {  
	        try {  
	            tx = session.beginTransaction();
	            
	            String sql2 = "select rental_id from Payment where customer_id='"+customer_id+"'";  
		        List list2 = session.createQuery(sql2).list();
		        if(!list2.isEmpty()) {  
		            Iterator it2 = list2.iterator();  
		            while(it2.hasNext()) {
		            	int rental_id = (Integer) it2.next();
		            	
		            	   String sql3 = "select payment_id from Payment where customer_id='"+rental_id+"'";  
		   		        List list3 = session.createQuery(sql3).list();
		   		        if(!list3.isEmpty()) {  
		   		            Iterator it3 = list3.iterator();  
		   		            while(it3.hasNext()) {
		   		            	int payment_id = (Integer) it3.next();
		   		            	Payment payment = (Payment) session.get(Payment.class, payment_id);
		   		            	session.delete(payment);
		   		            }
		   		        }
		            	
		            	
		            	
		            	Rental rental =  (Rental) session.get(Rental.class, rental_id);
		            	session.delete(rental);
		            }
		        }
	            
	            String sql = "select payment_id from Payment where customer_id='"+customer_id+"'";  
		        List list = session.createQuery(sql).list();
		        if(!list.isEmpty()) {  
		            Iterator it = list.iterator();  
		            while(it.hasNext()) {
		            	int payment_id = (Integer) it.next();
		            	Payment payment = (Payment) session.get(Payment.class, payment_id);
		            	session.delete(payment);
		            }
		        }
		       
	            
	            Customer customer = 
	                    (Customer)session.get(Customer.class, customer_id);
	            session.delete(customer);
	            System.out.println("删除了一个用户");
	            tx.commit();  
	        } catch (HibernateException e) {  
	            HibernateUtil.rollback(tx);
	            System.out.println("事务回滚了");
	        } finally {  
	            HibernateUtil.closeSession();  
	        }  
	    }  
	      
	    public Customer find(int id) {  
	    	Customer customer = null;  
	        tx = session.beginTransaction();  
	        customer = (Customer) session.get(Customer.class, id);  
	        tx.commit();  
	        HibernateUtil.closeSession();  
	        return customer;      
	    }
	    
	    public List select(){
	    	 tx = session.beginTransaction();  
	    	 List customer = session.createQuery("FROM Customer").list(); 	   
	    	 tx.commit();  
		        HibernateUtil.closeSession();  
	    	return customer;
	    }
	    
	      
	    public void update(int id,String first_name,String last_name,String email,int address_id) {  
	        tx = session.beginTransaction(); 
	        Customer customer = (Customer) session.get(Customer.class, id);
	        customer.setFirst_name(first_name);
			customer.setLast_name(last_name);
			customer.setEmail(email);
			customer.setAddress_id(address_id);
	        session.update(customer);  
	        tx.commit();  
	        HibernateUtil.closeSession();  
	    }  
	      
	    public boolean check(Customer customer) {  
	        tx = session.beginTransaction();  
	        String sql = "select last_name from Customer where first_name='"+customer.getFirst_name()+"'";  
	        List list = session.createQuery(sql).list();  
	        if(!list.isEmpty()) {  
	            Iterator it = list.iterator();  
	            while(it.hasNext()) {  
	                String get = (String) it.next();  
	                System.out.println(get);  
	                if(get.equals(customer.getLast_name())) {  
	                    HibernateUtil.closeSession();  
	                    return true;  
	                }  
	            }  
	        }  
	        HibernateUtil.closeSession();  
	        return false;     
	    }  
}
