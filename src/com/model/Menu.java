package com.model;

import javax.persistence.*;


@Entity
@Table(name = "menu", schema = "", catalog = "restaurantmanager")
public class Menu {

private int id;
private String dish;
private int price;

public Menu(){};
public Menu(int id,String dish, int price)
{
	this.id=id;
	this.dish=dish;
	this.price=price;
}

@Id
@Column(name = "dish_id")
 public int getId() {
     return id;
 }

 public void setId(int id) {
     this.id = id;
 }
 
 @Basic
 @Column(name = "dish_name")
   public String getDish() {
       return dish;
   }

   public void setDish(String dish) {
       this.dish = dish;
   }	
   
   @Basic
   @Column(name = "dish_price")
     public int getDishPrice() {
         return price;
     }

     public void setDishPrice(int price) {
         this.price = price;
     }
	
     @Override
     public boolean equals(Object o) {
         if (this == o) return true;
         if (o == null || getClass() != o.getClass()) return false;

         Menu that = (Menu) o;

         if (id != that.id) return false;        
         if (dish != null ? !dish.equals(that.dish) : that.dish != null) return false;            
         if (price != that.price) return false;
           
         return true;
     }

     @Override
     public int hashCode() {
         int result = id;
         result = 31 * result + (dish != null ? dish.hashCode() : 0);              
         result = 31 * result + price;
         
         return result;
     }
}
