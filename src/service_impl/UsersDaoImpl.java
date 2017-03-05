package service_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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
			List list = q.getResultList();
			t.commit();
			if (list.size() > 0)
				return true;
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
