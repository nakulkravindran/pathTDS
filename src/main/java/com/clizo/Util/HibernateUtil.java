
package com.clizo.Util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil{
	
	private static StandardServiceRegistry StandardServiceRegistry;
	private static SessionFactory SessionFactory;
	
	static{
		try{
			if(SessionFactory==null){
				
				Configuration configuration = new Configuration();
	            configuration.configure("hibernate.cfg.xml");
	            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
	            SessionFactory = configuration.buildSessionFactory(serviceRegistry);
	           
	         }
		}
		catch(Exception e){
			e.printStackTrace();
			if(StandardServiceRegistry!=null){
				StandardServiceRegistryBuilder.destroy(StandardServiceRegistry);
			}
			}	
	         
	}
	
	public static SessionFactory getSessionFactory(){
		 return SessionFactory;
	}
	
	
}