package createTablesTest;
import java.util.EnumSet;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.boot.spi.MetadataImplementor;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.Service;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.hibernate.tool.schema.TargetType;
import org.junit.Test;

public class TestsCreateTables {
	@Test
	public void testCreateTable(){
		//�������ö���
		Configuration config = new Configuration().configure();
		//��������ע�����
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();

		MetadataImplementor metadata = (MetadataImplementor) new MetadataSources(serviceRegistry).buildMetadata();

		new SchemaExport().create(EnumSet.of(TargetType.DATABASE), metadata);
//		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(config.getProperties()).build();
//		//����SessionFactory
//		SessionFactory  sessionFactory = config.buildSessionFactory(serviceRegistry);
//		//����session����
//		Session session = sessionFactory.getCurrentSession();
//		//����SchemaExport����
//		SchemaExport export = new SchemaExport();
//		export.create(true, true);
	}

}
