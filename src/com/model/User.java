package com.model;

import javax.persistence.*;

@Entity
@Table(name = "user", schema = "", catalog = "restaurantmanager")
public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private String role;
    private String birthdate;
    private String telephone;
    private String contractnb;

    public User(){};
    public User(int id, String firstName,String lastName, String userName, String password, String role, String birthdate, String telephone, String contractnb)
    {
    	this.id = id;
    	this.firstName = firstName;
    	this.lastName = lastName;
    	this.userName = userName;
    	this.password = password;
    	this.role = role;
    	this.birthdate = birthdate;
    	this.telephone = telephone;
    	this.contractnb = contractnb;
    }
    public User(String firstName,String lastName, String userName, String password, String role, String birthdate, String telephone, String contractnb)
    {
    	this.firstName = firstName;
    	this.lastName = lastName;
    	this.userName = userName;
    	this.password = password;
    	this.role = role;
    	this.birthdate = birthdate;
    	this.telephone = telephone;
    	this.contractnb = contractnb;
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
  @Column(name = "first_name")
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

  @Basic
  @Column(name = "last_name")
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

   @Basic
   @Column(name = "user_name")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

   @Basic
   @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

  @Basic
  @Column(name = "role")
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    @Basic
    @Column(name = "birthdate")
      public String getBirthdate() {
          return  birthdate;
      }

      public void setBirthdate(String birthdate) {
          this.birthdate = birthdate;
      }
      
      @Basic
      @Column(name = "telephone")
        public String getTelephone() {
            return telephone;
        }

        public void setTelephone(String telephone) {
            this.telephone = telephone;
        }
        
        @Basic
        @Column(name = "contractnr")
          public String getContractnb() {
              return contractnb;
          }

          public void setContractnb(String contractnb) {
              this.contractnb = contractnb;
          }
        
        

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User that = (User) o;

        if (id != that.id) return false;
        if (firstName != null ? !firstName.equals(that.firstName) : that.firstName != null) return false;
        if (lastName != null ? !lastName.equals(that.lastName) : that.lastName != null) return false;
        if (userName != null ? !userName.equals(that.userName) : that.userName != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;
        if (role != null ? !role.equals(that.role) : that.role != null) return false;
        if (birthdate != null ? !birthdate.equals(that.birthdate) : that.birthdate != null) return false;
        if (telephone != null ? !telephone.equals(that.telephone) : that.telephone != null) return false;
        if (contractnb != null ? !contractnb.equals(that.contractnb) : that.contractnb != null) return false;
                
        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
        result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (role != null ? role.hashCode() : 0);
        result = 31 * result + (birthdate != null ? birthdate.hashCode() : 0);
        result = 31 * result + (telephone != null ? telephone.hashCode() : 0);
        result = 31 * result + (contractnb != null ? contractnb.hashCode() : 0);
        return result;
    }
}