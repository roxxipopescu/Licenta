package com.model;

import javax.persistence.*;


@Entity
@Table(name = "restauranttables", schema = "", catalog = "restaurantmanager")
public class RestaurantTables {

	private int id;
	private String state;
	
	public RestaurantTables() {}
	
	public RestaurantTables(int id, String state) 
	{
		this.id = id;
		this.state=state;
	}
	
	 @Id
	    @Column(name = "idrestauranttables")
	     public int getId() {
	         return id;
	     }

	     public void setId(int id) {
	         this.id = id;
	     }
	     
	     @Basic
	     @Column(name = "state")
	     public String getState(){
	    	 return state;
	     }
	     
	     public void setState(String state)
	     {
	    	 this.state=state;
	     }
	     
	     
	     @Override
         public boolean equals(Object o) {
             if (this == o) return true;
             if (o == null || getClass() != o.getClass()) return false;

             RestaurantTables that = (RestaurantTables) o;

             if (id != that.id) return false;
             if (state != null ? !state.equals(that.state) : that.state != null) return false;
             
             return true;
	     }
	     
	     @Override
         public int hashCode() {
             int result = id;
             result = 31 * result + (state != null ? state.hashCode() : 0);
             
             return result;
         }
	     
	     
}
