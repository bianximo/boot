package db;


import org.hibernate.Session;


import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateSessionFactory {
	private static SessionFactory sessionFactory;//�Ự����

	//���췽��˽�л�����֤����ģʽ
	private HibernateSessionFactory(){
		
	}
	//����������̬��������ûỰ��������
	public static SessionFactory getSessionFactory(){
		if(sessionFactory==null){
			ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
			sessionFactory=new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
			return sessionFactory;
		}
		else return sessionFactory;
	}
	
}
