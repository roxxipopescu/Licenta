package com.model;

import javax.persistence.*;

@Entity
@Table(name = "income", schema = "", catalog = "restaurantmanager")
public class Income {
    private int id;
    private int waiter_id;
    private String date;
    private double order_total_cost;
    private String ordered_dishes;
    private Integer table_id;
   
    public Income(){};
    public Income(int id, int waiter_id,String date, double order_total_cost, String ordered_dishes, int table_id)
    {
    	this.id = id;
    	this.waiter_id = waiter_id;
    	this.date = date;    
    	this.order_total_cost = order_total_cost;
    	this.ordered_dishes = ordered_dishes;
    	this.table_id =table_id;
    	
    }
    
    public Income(int waiter_id,String date,  double order_total_cost, String ordered_dishes, int table_id)
    {
    	
    	this.waiter_id = waiter_id;
    	this.date = date;   	
    	this.order_total_cost = order_total_cost;
    	this.ordered_dishes =ordered_dishes;
    	this.table_id = table_id;
    }

    @Id
    @Column(name = "idincome")
     public int getId() {
         return id;
     }

     public void setId(int id) {
         this.id = id;
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
     @Column(name = "date")
       public String getDate() {
           return date;
       }

       public void setDate(String date) {
           this.date = date;
       }	
       
       @Basic
       @Column(name = "order_total_cost")
         public double getOrderTotalCost() {
             return order_total_cost;
         }

         public void setOrderTotalCost(double order_total_cost) {
             this.order_total_cost = order_total_cost;
         }
         
         @Basic
         @Column(name = "ordered_dishes")
           public String getOrderedDishes() {
               return ordered_dishes;
           }

           public void setOrderedDishes(String ordered_dishes) {
               this.ordered_dishes = ordered_dishes;
           }	
           
           @Basic
           @Column(name = "table_id")
             public int getTableId() {
                 return table_id;
             }

             public void setTableId(Integer table_id) {
                 this.table_id = table_id;
             }
       
           @Override
           public boolean equals(Object o) {
               if (this == o) return true;
               if (o == null || getClass() != o.getClass()) return false;

               Income that = (Income) o;

               if (id != that.id) return false;
               if (waiter_id != that.waiter_id) return false;
               if (date != null ? !date.equals(that.date) : that.date != null) return false; 
               if (ordered_dishes != null ? !ordered_dishes.equals(that.ordered_dishes) : that.ordered_dishes != null) return false;
               if (order_total_cost != that.order_total_cost) return false;
               if (table_id != that.table_id) return false;
               
               return true;
           }

           @Override
           public int hashCode() {
               int result = id;
               result = 31 * result + (date != null ? date.hashCode() : 0); 
               result = 31 * result + (ordered_dishes != null ? ordered_dishes.hashCode() : 0); 
               result = 31 * result + waiter_id;
               result = (int) (31 * result + order_total_cost);
               result = 31 * result + table_id;
               
               return result;
           }
           
}
