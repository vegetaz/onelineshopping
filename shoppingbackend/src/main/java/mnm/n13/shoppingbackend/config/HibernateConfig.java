package mnm.n13.shoppingbackend.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages={"mnm.n13.shoppingbackend.dto"})
@EnableTransactionManagement
public class HibernateConfig {

	// Change the below based on the DBMS you choose H2 Database
	/*
	 * private final static String DATABASE_URL =
	 * "jdbc:h2:tcp://localhost/~/onlineshopping"; private final static String
	 * DATABASE_DRIVER = "org.h2.Driver"; private final static String
	 * DATABASE_DIALECT = "org.hibernate.dialect.H2Dialect"; private final static
	 * String DATABASE_USERNAME = "sa"; private final static String
	 * DATABASE_PASSWORD = "";
	 */
	
	// Change the below based on the DBMS you choose mysql
	private final static String DATABASE_URL = "jdbc:mysql://localhost:3306/onlineshopping";/*"jdbc:mysql://localhost:3306/onlineshopping?useUnicode=true" + 
				"&connectionCollation=utf8_general_ci" + 
				"&characterSetResults=utf8&characterEncoding=utf-8";*/
		private final static String DATABASE_DRIVER = "com.mysql.cj.jdbc.Driver"; //"com.mysql.jdbc.Driver";
		private final static String DATABASE_DIALECT = "org.hibernate.dialect.MySQLDialect";
		private final static String DATABASE_USERNAME = "root";
		private final static String DATABASE_PASSWORD = "25101989";
		
	// dataSource bean will be available
	@Bean("dataSource")
	public DataSource getDataSource() {
		
		BasicDataSource dataSource = new BasicDataSource();
		
		// Providing the database connection information
		dataSource.setDriverClassName(DATABASE_DRIVER);
		dataSource.setUrl(DATABASE_URL);
		dataSource.setUsername(DATABASE_USERNAME);
		dataSource.setPassword(DATABASE_PASSWORD);
				
		
		return dataSource;
		
	}
	
	// sessionFactory bean will be available
	
	@Bean
	public SessionFactory getSessionFactory(DataSource dataSource) {
		
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource);
		
		builder.addProperties(getHibernateProperties());
		builder.scanPackages("mnm.n13.shoppingbackend.dto");
		
		return builder.buildSessionFactory();
		
	}

	
	
	// All the hibernate properties will be returned in this method	
	private Properties getHibernateProperties() {
		
		Properties properties = new Properties();
		
		
		properties.put("hibernate.dialect", DATABASE_DIALECT);		
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.format_sql", "true");
		
		//properties.put("hibernate.hbm2ddl.auto", "create");
		
		
		return properties;
	}
	
	// transactionManager bean
	@Bean
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}
	
	
}
