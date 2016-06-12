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
    private int waiter_id;
    private int table_id;
   
    public Order(){};
    public Order(int id, int quantity,String dish, String specifications, String fidelitycarddiscount, 
    		int waiter_id, int table_id)
    {
    	this.id = id;
    	this.quantity = quantity;
    	this.dish = dish;
    	this.specifications = specifications;
    	this.fidelitycarddiscount = fidelitycarddiscount;
    	this.waiter_id=waiter_id;
    	this.table_id = table_id;
    	
    	
    	
    }
    
    public Order(int quantity,String dish, String specifications, String fidelitycarddiscount, 
    		int waiter_id, int table_id)
    {
    	
    	this.quantity = quantity;
    	this.dish = dish;
    	this.specifications = specifications;
    	this.fidelitycarddiscount = fidelitycarddiscount;
    	this.waiter_id=waiter_id;
    	this.table_id = table_id;
    	
    	
    }

    public Order(int id, int quantity,String dish, String specifications, String fidelitycarddiscount)
    {
    	this.id = id;
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
           
           @Basic
           @Column(name = "waiter_id")
             public int getWaiterId() {
                 return waiter_id;
             }

             public void setWaiterId(int waiter_id) {
                 this.waiter_id = waiter_id;
             }
             
             @Basic
             @Column(name = "table_id")
               public int getTableId() {
                   return table_id;
               }

               public void setTableId(int table_id) {
                   this.table_id = table_id;
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
               if (waiter_id != that.waiter_id) return false;
               if (table_id != that.table_id) return false;
               
               
               return true;
           }

           @Override
           public int hashCode() {
               int result = id;
               result = 31 * result + (dish != null ? dish.hashCode() : 0);
               result = 31 * result + (specifications != null ? specifications.hashCode() : 0);
               result = 31 * result + (fidelitycarddiscount != null ? fidelitycarddiscount.hashCode() : 0);
               result = 31 * result + quantity;
               result = 31 * result + waiter_id;
               result = 31 * result + table_id;
             
               
               return result;
           }
           
}
