package com.dao;

import org.hibernate.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.model.User;

import java.util.List;


public class UserDao {

    private static final Log LOGGER = LogFactory.getLog(UserDao.class);

    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    public User findUser(String username, String password){
        Session session = factory.openSession();
        Transaction tx = null;
        List<User> users = null;
        try{
            tx=session.beginTransaction();
            Query query = session.createQuery("FROM User U where U.userName= :username and U.password= :password");
            query.setParameter("password", password);
            query.setParameter("username", username);
            users=query.list();
            tx.commit();
        }catch(HibernateException e){
            if (tx!=null){
                tx.rollback();
            }
            LOGGER.error("", e);
        }
        finally{
            session.close();
        }
        return users != null && !users.isEmpty() ? users.get(0):null;
    }

    public User addUser(User user) {
        int userId = -1;
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            userId = (Integer) session.save(user);
            user.setId(userId);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }
        return user;
    }

    @SuppressWarnings("unchecked")
    public List<User> findUsers(){
        Session session = factory.openSession();
        Transaction tx = null;
        List<User> users = null;
        try{
            tx = session.beginTransaction();
            users = session.createQuery("FROM User").list();
            tx.commit();
        } catch (HibernateException e){
            if (tx != null){
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }
        return users;
    }



    @SuppressWarnings("unchecked")
    public boolean removeUser(int id){
        boolean ok = false;
        Session session = factory.openSession();
        Transaction tx = null;
        List<User> users = null;
        try{
            tx=session.beginTransaction();
            Query query = session.createQuery("FROM User WHERE id = :id");
            query.setParameter("id", id);
            users = query.list();
            tx.commit();
        } catch (HibernateException e){
            if (tx != null){
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }

        session = factory.openSession();
        if (!users.isEmpty())
            try{
                ok = true;
                tx=session.beginTransaction();
                session.delete(users.get(0));
                tx.commit();
            } catch (HibernateException e){
                if (tx != null){
                    tx.rollback();
                }
                LOGGER.error("", e);
            }finally {
                session.close();
            }
        return ok;
    }

    public void updateUser(User oldUser, User newUser)
    {
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx=session.beginTransaction();
            Object obj = session.load(User.class, oldUser.getId());
            User user1 = (User)obj;
            user1.setFirstName(newUser.getFirstName());
            user1.setLastName(newUser.getLastName());
            user1.setUserName(newUser.getUserName());
            user1.setPassword(newUser.getPassword());
            user1.setRole(newUser.getRole());
            session.update(user1);
            tx.commit();
        } catch (HibernateException e)
        {
            if (tx != null){
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }
    }

}