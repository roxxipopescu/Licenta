package com.dao;

import org.hibernate.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.model.Order;
import com.model.RestaurantTables;
import java.util.List;

public class RestaurantTablesDao {

	private static final Log LOGGER = LogFactory.getLog(RestaurantTablesDao.class);

    private SessionFactory factory;

    public RestaurantTablesDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    @SuppressWarnings("unchecked")
    public List<RestaurantTables> findRestaurantTables(){
        Session session = factory.openSession();
        Transaction tx = null;
        List<RestaurantTables> tables = null;
        try{
            tx = session.beginTransaction();
            tables = session.createQuery("FROM RestaurantTables").list();
            tx.commit();
        } catch (HibernateException e){
            if (tx != null){
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }
        return tables;
    }
    
    @SuppressWarnings("unchecked")
    public RestaurantTables findRestaurantTable(int id){
        Session session = factory.openSession();
        Transaction tx = null;
        List<RestaurantTables> resttable = null;
        try{
            tx=session.beginTransaction();
            Query query = session.createQuery("FROM RestaurantTables WHERE id = :id");
            query.setParameter("id", id);
            resttable = query.list();
            tx.commit();
        } catch (HibernateException e){
            if (tx != null){
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }
        return resttable != null && !resttable.isEmpty() ? resttable.get(0):null;
    }

    public void updateRT(RestaurantTables oldrt, RestaurantTables newrt)
    {
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx=session.beginTransaction();
            Object obj = session.load(RestaurantTables.class, oldrt.getId());
            RestaurantTables t1 = (RestaurantTables)obj;
            t1.setState(newrt.getState());                      
            session.update(t1);
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
