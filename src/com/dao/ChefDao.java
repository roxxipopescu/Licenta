package com.dao;

import org.hibernate.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.model.Chef;


import java.util.List;


public class ChefDao {

	 private static final Log LOGGER = LogFactory.getLog(ChefDao.class);

	    private SessionFactory factory;

	    public ChefDao(SessionFactory factory) {
	        this.factory = factory;
	    }
	    
	    public Chef addChef(Chef chef) {
	        int chefId = -1;
	        Session session = factory.openSession();
	        Transaction tx = null;
	        try {
	            tx = session.beginTransaction();
	            chefId = (Integer) session.save(chef);
	            chef.setId(chefId);
	            tx.commit();
	        } catch (HibernateException e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            LOGGER.error("", e);
	        } finally {
	            session.close();
	        }
	        return chef;
	    }
	    
	    @SuppressWarnings("unchecked")
	    public List<Chef> findChefs(){
	        Session session = factory.openSession();
	        Transaction tx = null;
	        List<Chef> chefs = null;
	        try{
	            tx = session.beginTransaction();
	            chefs = session.createQuery("FROM Chef").list();
	            tx.commit();
	        } catch (HibernateException e){
	            if (tx != null){
	                tx.rollback();
	            }
	            LOGGER.error("", e);
	        } finally {
	            session.close();
	        }
	        return chefs;
	    }


	    @SuppressWarnings("unchecked")
	    public boolean removeChef(int id){
	        boolean ok = false;
	        Session session = factory.openSession();
	        Transaction tx = null;
	        List<Chef> chefs = null;
	        try{
	            tx=session.beginTransaction();
	            Query query = session.createQuery("FROM Chef WHERE id = :id");
	            query.setParameter("id", id);
	            chefs = query.list();
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
	        if (!chefs.isEmpty())
	            try{
	                ok = true;
	                tx=session.beginTransaction();
	                session.delete(chefs.get(0));
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


	
}
