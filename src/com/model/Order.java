package com.model;

import javax.persistence.*;

@Entity
@Table(name = "orders", schema = "", catalog = "restaurantmanager")
public class Order {
    private int id;
    private int quantity;
    private String dish;
    private String specifications;
    private String fidelitycarddiscount;
   
    public Order(){};
    public Order(int id, int quantity,String dish, String specifications, String fidelitycarddiscount)
    {
    	this.id = id;
    	this.quantity = quantity;
    	this.dish = dish;
    	this.specifications = specifications;
    	this.fidelitycarddiscount = fidelitycarddiscount;
    	
    }
    
    public Order(int quantity,String dish, String specifications, String fidelitycarddiscount)
    {
    	
    	this.quantity = quantity;
    	this.dish = dish;
    	this.specifications = specifications;
    	this.fidelitycarddiscount = fidelitycarddiscount;
    	
    }

    @Id
    @Column(name = "id")
     public int getId() {
         return id;
     }

     public void setId(int id) {
         this.id = id;
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
       @Column(name = "specifications")
         public String getSpecifications() {
             return specifications;
         }

         public void setSpecifications(String specifications) {
             this.specifications = specifications;
         }
         
         @Basic
         @Column(name = "fidelity_card_discount")
           public String getFidelityCardDiscount() {
               return fidelitycarddiscount;
           }

           public void setFidelityCardDiscount(String fidelitycarddiscount) {
               this.fidelitycarddiscount = fidelitycarddiscount;
           }


           @Override
           public boolean equals(Object o) {
               if (this == o) return true;
               if (o == null || getClass() != o.getClass()) return false;

               Order that = (Order) o;

               if (id != that.id) return false;
               if (quantity != that.quantity) return false;
               if (dish != null ? !dish.equals(that.dish) : that.dish != null) return false;
               if (specifications != null ? !specifications.equals(that.specifications) : that.specifications != null) return false;
               if (fidelitycarddiscount != null ? !fidelitycarddiscount.equals(that.fidelitycarddiscount) : that.fidelitycarddiscount != null) return false;
                 
               return true;
           }

           @Override
           public int hashCode() {
               int result = id;
               result = 31 * result + (dish != null ? dish.hashCode() : 0);
               result = 31 * result + (specifications != null ? specifications.hashCode() : 0);
               result = 31 * result + (fidelitycarddiscount != null ? fidelitycarddiscount.hashCode() : 0);
               result = 31 * result + quantity;
               
               return result;
           }
           
}