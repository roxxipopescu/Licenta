package com.dao;

import org.hibernate.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.model.Order;


import java.util.List;


public class OrderDao {

	  private static final Log LOGGER = LogFactory.getLog(OrderDao.class);

    private SessionFactory factory;

    public OrderDao(SessionFactory factory) {
        this.factory = factory;
    }

    @SuppressWarnings("unchecked")
    public List<Order> findOrders(){
        Session session = factory.openSession();
        Transaction tx = null;
        List<Order> orders = null;
        try{
            tx = session.beginTransaction();
            orders = session.createQuery("FROM Order").list();
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
        return orders;
    }


    public Order addOrder(Order order) {
        int orderId = -1;
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            orderId = (Integer) session.save(order);
            order.setId(orderId);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }
        return order;
    }

    @SuppressWarnings("unchecked")
    public boolean removeOrder(int id){
        boolean ok = false;
        Session session = factory.openSession();
        Transaction tx = null;
        List<Order> orders = null;
        try{
            tx=session.beginTransaction();
            Query query = session.createQuery("FROM Order WHERE id = :id");
            query.setParameter("id", id);
            orders = query.list();
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
        if (!orders.isEmpty())
            try{
                ok = true;
                tx=session.beginTransaction();
                session.delete(orders.get(0));
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
    public Order findOrder(int id){
        Session session = factory.openSession();
        Transaction tx = null;
        List<Order> orders = null;
        try{
            tx=session.beginTransaction();
            Query query = session.createQuery("FROM Order WHERE id = :id");
            query.setParameter("id", id);
            orders = query.list();
            tx.commit();
        } catch (HibernateException e){
            if (tx != null){
                tx.rollback();
            }
            LOGGER.error("", e);
        } finally {
            session.close();
        }
        return orders != null && !orders.isEmpty() ? orders.get(0):null;
    }

    public void updateOrder(Order oldOrder, Order newOrder)
    {
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx=session.beginTransaction();
            Object obj = session.load(Order.class, oldOrder.getId());
            Order order1 = (Order)obj;
            order1.setQuantity(newOrder.getQuantity());
            order1.setDish(newOrder.getDish());
            order1.setSpecifications(newOrder.getSpecifications());
            order1.setFidelityCardDiscount(newOrder.getFidelityCardDiscount());            
            session.update(order1);
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

