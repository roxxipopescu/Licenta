package com.model;

import javax.persistence.*;

@Entity
@Table(name = "fidelitycards", schema = "", catalog = "restaurantmanager")
public class FidelityCards {
	
	private int id;
	private String name;
	private String surname;
	private String bdate;
	private String email;
	
	public FidelityCards() {};
	public FidelityCards(int id, String name, String surname, String bdate, String email)
	{
		this.id=id;
		this.name=name;
		this.surname=surname;
		this.bdate=bdate;
		this.email=email;
	}
	
	public FidelityCards( String name, String surname, String bdate, String email)
	{		
		this.name=name;
		this.surname=surname;
		this.bdate=bdate;
		this.email=email;
	}
	
	 @Id
	    @Column(name = "idfidelitycards")
	     public int getId() {
	         return id;
	     }

	     public void setId(int id) {
	         this.id = id;
	     }
	     
	     @Basic
	     @Column(name = "owner_name")
	       public String getName() {
	           return name;
	       }

	       public void setName(String name) {
	           this.name = name;
	       }	
	       
	       @Basic
	       @Column(name = "owner_surname")
	         public String getSurname() {
	             return surname;
	         }

	         public void setSurname(String surname) {
	             this.surname = surname;
	         }	
	         
	         @Basic
	         @Column(name = "birthdate")
	           public String getBirthdate() {
	               return bdate;
	           }

	           public void setBirthdate(String bdate) {
	               this.bdate = bdate;
	           }	
	           
	           @Basic
	           @Column(name = "email")
	             public String getEmail() {
	                 return email;
	             }

	             public void setEmail(String email) {
	                 this.email = email;
	             }	
	             
	             @Override
	             public boolean equals(Object o) {
	                 if (this == o) return true;
	                 if (o == null || getClass() != o.getClass()) return false;

	                 FidelityCards that = (FidelityCards) o;

	                 if (id != that.id) return false;
	                 if (name != null ? !name.equals(that.name) : that.name != null) return false; 
	                 if (surname != null ? !surname.equals(that.surname) : that.surname != null) return false;
	                 if (bdate != null ? !bdate.equals(that.bdate) : that.bdate != null) return false; 
	                 if (email != null ? !email.equals(that.email) : that.email != null) return false;

	                 
	                 return true;
	             }

	             @Override
	             public int hashCode() {
	                 int result = id;
	                 result = 31 * result + (email != null ? email.hashCode() : 0); 
	                 result = 31 * result + (bdate != null ? bdate.hashCode() : 0); 
	                 result = 31 * result + (name != null ? name.hashCode() : 0); 
	                 result = 31 * result + (surname != null ? surname.hashCode() : 0); 
	             	                 
	                 return result;
	             }
	

}
