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
	
	// ʵ�ֲ�ѯ����ѧ��
	@Override
	public List<Students> queryStudents() {
		Transaction transaction = null;
		String hql = "from Students";
		List<Students> list = null;
		try {
			SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
			Session session = sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			Query<Students> query = session.createQuery(hql);
			list = query.getResultList();
			transaction.commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return list;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

	// ʵ��ͨ��id��ѯѧ��
	@Override
	public Students queryStudentById(String id) {
		Transaction transaction = null;
		Students s = null;
		try {
			SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
			Session session = sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			s = session.get(Students.class, id);
			transaction.commit();
			return s;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.commit();
			return s;
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}

	@Override
	public boolean updateStudent(Students s) {
		Transaction transaction = null;
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			session.update(s);
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
	public boolean addStudent(Students s) {

		s.setSid(getNewSid());//Ϊѧ��������ѧ��
		Transaction transaction = null;
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			session.save(s);
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
	public boolean removeStudent(String id) {
		Transaction transaction = null;
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			transaction = session.beginTransaction();
			Students stu = session.get(Students.class, id);
			session.delete(stu);
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
	
	//��ȡѧ������
	public int getstuNum(){
		Transaction transaction = null;
		String hql = "from Students";
		List<Students> list = null;
		try {
			SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
			Session session = sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			Query<Students> query = session.createQuery(hql);
			list = query.getResultList();
			transaction.commit();
			return list.size();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.commit();
			return list.size();
		} finally {
			if (transaction != null)
				transaction = null;
		}
	}
	
	private String getNewSid() {
		//���һ����ѧ�ţ�ȥ����ͷ��S�������ּ�һ��ƴ����S
		Transaction transaction = null;
		String hql = "select max(sid) from Students";
		String sid = null;
		try {
			SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
			Session session = sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			Query<String> query = session.createQuery(hql);
			sid = query.uniqueResult();
			String temp = sid.substring(1);

			int i = Integer.parseInt(temp);

			i++;

			temp = String.valueOf(i);

			StringBuffer buf = new StringBuffer();

			buf.append("S");

			int len = temp.length();

			// �չ���λ

			for (int j = 0; j < 7 - len; j++) {

				buf.append("0");

			}

			sid = buf.append(temp).toString();
			transaction.commit();
			return sid;
		} catch (Exception e) {
			e.printStackTrace();
			transaction.commit();
			return sid;
		} finally {
			if (transaction != null)
				transaction = null;
		}

	}
}
