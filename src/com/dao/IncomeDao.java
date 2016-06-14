package com.dao;

import org.hibernate.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.model.Income;


import java.util.List;


public class IncomeDao {

	  private static final Log LOGGER = LogFactory.getLog(IncomeDao.class);

	    private SessionFactory factory;

	    public IncomeDao(SessionFactory factory) {
	        this.factory = factory;
	    }

	    public Income addIncome(Income income) {
	        int incomeId = -1;
	        Session session = factory.openSession();
	        Transaction tx = null;
	        try {
	            tx = session.beginTransaction();
	            incomeId = (Integer) session.save(income);
	            income.setId(incomeId);
	            tx.commit();
	        } catch (HibernateException e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            LOGGER.error("", e);
	        } finally {
	            session.close();
	        }
	        return income;
	    }
	    
	    @SuppressWarnings("unchecked")
	    public List<Income> findIncomes(){
	        Session session = factory.openSession();
	        Transaction tx = null;
	        List<Income> incomes = null;
	        try{
	            tx = session.beginTransaction();
	            incomes = session.createQuery("FROM Income").list();
	            tx.commit();
	        } catch (HibernateException e){
	            if (tx != null){
	                tx.rollback();
	            }
	            LOGGER.error("", e);
	        } finally {
	            session.close();
	        }
	        return incomes;
	    }


	    @SuppressWarnings("unchecked")
	    public boolean removeIncome(int id){
	        boolean ok = false;
	        Session session = factory.openSession();
	        Transaction tx = null;
	        List<Income> incomes = null;
	        try{
	            tx=session.beginTransaction();
	            Query query = session.createQuery("FROM Income WHERE id = :id");
	            query.setParameter("id", id);
	            incomes = query.list();
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
	        if (!incomes.isEmpty())
	            try{
	                ok = true;
	                tx=session.beginTransaction();
	                session.delete(incomes.get(0));
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
