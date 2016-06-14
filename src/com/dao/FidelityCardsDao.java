package com.dao;

import com.model.FidelityCards;

import org.hibernate.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import java.util.List;

public class FidelityCardsDao {

	private static final Log LOGGER = LogFactory.getLog(FidelityCardsDao.class);

    private SessionFactory factory;

    public FidelityCardsDao(SessionFactory factory) {
        this.factory = factory;
    }

    @SuppressWarnings("unchecked")
    public List<FidelityCards> findFidelityCards(){
        Session session = factory.openSession();
        Transaction tx = null;
        List<FidelityCards> fcards = null;
        try{
            tx = session.beginTransaction();
            fcards = session.createQuery("FROM FidelityCards").list();
            tx.commit();
        } catch (HibernateException e){
            if (tx != null){
                tx.rollback();
            }
            LOGGER.error("", e);
            System.out.println(e);
        } finally {
            session.close();
        }
        return fcards;
    }


    public FidelityCards addFidelityCards(FidelityCards fcard) {
        int fcardId = -1;
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            fcardId = (Integer) session.save(fcard);
            fcard.setId(fcardId);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }
        return fcard;
    }

    @SuppressWarnings("unchecked")
    public boolean removeFidelityCards(int id){
        boolean ok = false;
        Session session = factory.openSession();
        Transaction tx = null;
        List<FidelityCards> fcards = null;
        try{
            tx=session.beginTransaction();
            Query query = session.createQuery("FROM FidelityCards WHERE id = :id");
            query.setParameter("id", id);
            fcards = query.list();
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
        if (!fcards.isEmpty())
            try{
                ok = true;
                tx=session.beginTransaction();
                session.delete(fcards.get(0));
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

    @SuppressWarnings("unchecked")
    public FidelityCards findFidelityCards(int id){
        Session session = factory.openSession();
        Transaction tx = null;
        List<FidelityCards> fcards = null;
        try{
            tx=session.beginTransaction();
            Query query = session.createQuery("FROM FidelityCards WHERE id = :id");
            query.setParameter("id", id);
            fcards = query.list();
            tx.commit();
        } catch (HibernateException e){
            if (tx != null){
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }
        return fcards != null && !fcards.isEmpty() ? fcards.get(0):null;
    }

    public void updateFidelityCards(FidelityCards oldfcard, FidelityCards newfcard)
    {
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx=session.beginTransaction();
            Object obj = session.load(FidelityCards.class, oldfcard.getId());
            FidelityCards fcard1 = (FidelityCards)obj;
            fcard1.setName(newfcard.getName());
            fcard1.setSurname(newfcard.getSurname());
            fcard1.setBirthdate(newfcard.getBirthdate());
            fcard1.setEmail(newfcard.getEmail());            
            session.update(fcard1);
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
