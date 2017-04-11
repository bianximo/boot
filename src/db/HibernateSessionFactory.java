package db;


import org.hibernate.Session;


import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateSessionFactory {
	private static SessionFactory sessionFactory;//会话工厂

	//构造方法私有化，保证单例模式
	private HibernateSessionFactory(){
		
	}
	//创建公共静态方法，获得会话工厂对象
	public static SessionFactory getSessionFactory(){
		if(sessionFactory==null){
			ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
			sessionFactory=new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
			return sessionFactory;
		}
		else return sessionFactory;
	}
	
}
