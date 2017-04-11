package service_impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import db.HibernateSessionFactory;
import entity.Message;
import service.MessageDao;

public class MessageDaoImpl implements MessageDao {

	@Override
	public boolean sendMessage(Message message) {
		Transaction transaction = null;
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			session.save(message);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.commit();
			return false;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

	@Override
	public List<Message> querySendMessage(int sendId) {
		Transaction transaction = null;
		String hql = "from Message where sendId = ?";
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Query<Message> query = session.createQuery(hql);
			query.setParameter(0, sendId);
			List<Message> list = query.getResultList();
			transaction.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (transaction != null) {
				transaction = null;
			}
		}
	}

	@Override
	public List<Message> queryReceiveMessage(int receiveId) {
		Transaction transaction = null;
		String hql = "from Message where receiveId = ?";
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Query<Message> query = session.createQuery(hql);
			query.setParameter(0, receiveId);
			List<Message> list = new ArrayList<>();
			list = query.getResultList();
			transaction.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (transaction != null) {
				transaction = null;
			}
		}
	}

	@Override
	public boolean deleteMessage(int mid) {
		Transaction transaction = null;
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Message message = session.get(Message.class, mid);
			session.delete(message);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (transaction != null) {
				transaction = null;
			}
		}
	}

	@Override
	public Message querySingleMessage(int mid) {
		Transaction transaction = null;
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Message message = session.get(Message.class, mid);
			message.setIsRead(1);
			session.save(message);
			transaction.commit();
			return message;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

}
