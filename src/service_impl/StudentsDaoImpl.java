package service_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import db.HibernateSessionFactory;
import entity.Students;
import service.StudentsDao;

//ѧ��ҵ���߼��ӿ�ʵ����
public class StudentsDaoImpl implements StudentsDao {

	//ʵ�ֲ�ѯ����ѧ��
	@Override
	public List<Students> queryStudents() {
		Transaction transaction = null;
		String hql = "from Students";
		List<Students>list = null;
		try {
			SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
			Session session = sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			Query<Students>query = session.createQuery(hql);
			list = query.getResultList();
			transaction.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.commit();
			return list;
		}finally {
			if(transaction!=null)transaction = null;
		}
	}

	//ʵ��ͨ��id��ѯѧ��
	@Override
	public Students queryStudentById(String id) {
		Transaction transaction = null;
		String hql = "from Students where sid = ?";
		Students s = null;
		try {
			SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
			Session session = sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			Query<Students>query = session.createQuery(hql);
			query.setParameter(0, id);
			s = query.getSingleResult();
			transaction.commit();
			return s;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.commit();
			return s;
		}finally {
			if(transaction!=null)transaction = null;
		}
	}

	@Override
	public boolean updateStudent(Students s) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addStudent(Students s) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeStudent(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
