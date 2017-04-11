package service_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;

import db.HibernateSessionFactory;
import entity.Users;
import service.UsersDao;

public class UsersDaoImpl implements UsersDao {

	@Override
	public boolean userLogin(Users user) {
		Transaction t = null;
		String hql = "";
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			t = session.beginTransaction();
			hql = "from Users where username=? and password=?";
			Query q = session.createQuery(hql);
			q.setParameter(0, user.getUsername());
			q.setParameter(1, user.getPassword());
			List<Users> list = q.getResultList();
			t.commit();
			if (list.size() > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			t.commit();
			return false;
		} finally {
			if (t != null) {
				t = null;
			}
		}
	}
	@Override
	public int getIdByUsername(String username){
		Transaction transaction = null;
		String hql = "from Users where username=?";
		try {
			Session session  = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Query<Users> q = session.createQuery(hql);
			q.setParameter(0, username);
			int result = q.uniqueResult().getUid();
			transaction.commit();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.commit();
			return -1;
		}finally {
			if(transaction!=null)transaction = null;
		}
	}
	
	@Override
	public boolean userRegist(Users user) {
		Transaction transaction = null;
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			session.save(user);
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

//	private int getNewUid() {
//		//获得一个新学号，去掉开头的S，将数字加一再拼接上S
//		Transaction transaction = null;
//		String hql = "select max(uid) from users";
//		int id = 0;
//		try {
//			SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
//			Session session = sessionFactory.getCurrentSession();
//			transaction = session.beginTransaction();
//			Query<Integer> query = session.createQuery(hql);
//			id = query.uniqueResult();
//			id++;
//			transaction.commit();
//			return id;
//		} catch (Exception e) {
//			e.printStackTrace();
//			transaction.commit();
//			return id;
//		} finally {
//			if (transaction != null)
//				transaction = null;
//		}
//
//	}

	//修改用户密码
	@Override
	public boolean userUpdate(Users user ,String newpassword) {
		Transaction t = null;
		String hql = "";
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			t = session.beginTransaction();
			hql = "from Users where username=? and password=?";
			Query<Users> q = session.createQuery(hql);
			q.setParameter(0, user.getUsername());
			q.setParameter(1, user.getPassword());
			List<Users> list = q.getResultList();
			if (list.size() > 0){
				Users newUsers = list.get(0);
				newUsers.setPassword(newpassword);
				session.update(newUsers);
				t.commit();
				return true;
			}
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (t != null) {
				t = null;
			}
		}
	}

	
}
