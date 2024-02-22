package org.eclipse.http.client;

import org.eclipse.model.Address;
import org.eclipse.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class AppManyToMany {

	public static void main(String[] args) {
		
		Configuration configuration = new Configuration().configure();
				
		try(SessionFactory sessionFactory = configuration.buildSessionFactory()){
			
			try(Session session = sessionFactory.openSession()){
        	        		
	        	try{
	      
	        		User user1 = session.find(User.class, 1);
	        		User user2 = session.find(User.class, 2);
	        		User user3 = session.find(User.class, 3);
	        		
	        		Address address1 = session.find(Address.class, 1);
	        		Address address2 = session.find(Address.class, 2);
	        		
	        		user1.addAddress(address1);
	        		
	        		user2.addAddress(address1);
	        		user2.addAddress(address2);
	        		
	        		user3.addAddress(address1);
	        		user3.addAddress(address2);
	        			        		
	        		session.persist(user1);
	        		session.persist(user2);
	        		session.persist(user3);
	        		session.flush();
	        	}
	        		
	        	catch (Exception e) {
	        			e.printStackTrace();
	        	}
			}
		}
		
        catch(NoClassDefFoundError e) {
        	e.printStackTrace();
        }
	}
}