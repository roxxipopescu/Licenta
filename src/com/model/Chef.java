package com.model;

import javax.persistence.*;

@Entity
@Table(name = "chef", schema = "", catalog = "restaurantmanager")
public class Chef {

	private int id;
	private int table_id;
	private String waiter_name;
	private int quantity;
	private String dish;
	private String time;
	
	public Chef(){};
	
	public Chef(int id, int table_id, String waiter_name, int quantity, String dish, String time)
	{
		this.id=id;
		this.table_id=table_id;
		this.waiter_name=waiter_name;
		this.quantity=quantity;
		this.dish=dish;
		this.time=time;
	}
	
	public Chef(int table_id, String waiter_name, int quantity, String dish, String time)
	{		
		this.table_id=table_id;
		this.waiter_name=waiter_name;
		this.quantity=quantity;
		this.dish=dish;
		this.time=time;
	}
	
	 @Id
	    @Column(name = "idchef")
	     public int getId() {
	         return id;
	     }

	     public void setId(int id) {
	         this.id = id;
	     }
	
	     @Basic
	     @Column(name = "table_id")
	       public int getTableId() {
	           return table_id;
	       }

	       public void setTableId(int table_id) {
	           this.table_id = table_id;
	       }
	       
	       @Basic
	       @Column(name = "waiter_name")
	         public String getWaiterName() {
	             return waiter_name;
	         }

	         public void setWaiterName(String waiter_name) {
	             this.waiter_name = waiter_name;
	         }	
	         
	         @Basic
		     @Column(name = "quantity")
		       public int getQuantity() {
		           return quantity;
		       }

		       public void setQuantity(int quantity) {
		           this.quantity = quantity;
		       }
	         
		       @Basic
		       @Column(name = "dish")
		         public String getDish() {
		             return dish;
		         }

		         public void setDish(String dish) {
		             this.dish = dish;
		         }	
		       
	         @Basic
	         @Column(name = "time")
	           public String getTime() {
	               return time;
	           }

	           public void setTime(String time) {
	               this.time = time;
	           }	
	           
	           @Override
	           public boolean equals(Object o) {
	               if (this == o) return true;
	               if (o == null || getClass() != o.getClass()) return false;

	               Chef that = (Chef) o;

	               if (id != that.id) return false;
	               if (table_id != that.table_id) return false;
	               if (waiter_name != null ? !waiter_name.equals(that.waiter_name) : that.waiter_name != null) return false; 
	               if (quantity != that.quantity) return false;
	               if (dish != null ? !dish.equals(that.dish) : that.dish != null) return false;
	               if (time != null ? !time.equals(that.time) : that.time != null) return false;
	                 
	               return true;
	           }

	           @Override
	           public int hashCode() {
	               int result = id;
	               result = 31 * result + (waiter_name != null ? waiter_name.hashCode() : 0); 
	               result = 31 * result + (dish != null ? dish.hashCode() : 0);
	               result = 31 * result + (time != null ? time.hashCode() : 0);
	               result = 31 * result + table_id;
	               result = 31 * result + quantity;
	               
	               return result;
	           }
	           
	         
}
