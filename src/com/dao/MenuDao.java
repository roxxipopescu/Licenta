package com.dao;

import org.hibernate.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.model.Menu;


import java.util.List;



public class MenuDao {
	
	private static final Log LOGGER = LogFactory.getLog(MenuDao.class);

    private SessionFactory factory;

    public MenuDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    @SuppressWarnings("unchecked")
    public List<Menu> findMenuItems(){
        Session session = factory.openSession();
        Transaction tx = null;
        List<Menu> menuItems = null;
        try{
            tx = session.beginTransaction();
            menuItems = session.createQuery("FROM Menu").list();
            tx.commit();
        } catch (HibernateException e){
            if (tx != null){
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }
        return menuItems;
    }

}
