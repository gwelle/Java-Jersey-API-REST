package org.eclipse.resource;

import java.util.List;
import java.util.stream.Collectors;

import org.eclipse.config.HibernateUtil;
import org.eclipse.dao.UserDao;
import org.eclipse.model.User;
import org.hibernate.Session;

import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.DefaultValue;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.PATCH;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;

@Path("personnes")
public class UserResource {
	
	@GET
	@Consumes({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })//Format de données autorisé
	@Produces({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })//Format de retour attendu
	public List<User> getUsers(){
		
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			UserDao userDao = new UserDao(session);
			return userDao.findAll();
		}
		
		catch(Exception e) {
			e.printStackTrace();	
		}
		return null;
	}
	
	@GET
	@Path("/{id}")
	@Consumes({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })//Format de données autorisé
	@Produces({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })//Format de retour attendu
	public User getUser(@PathParam(value = "id") int id) {
		
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			UserDao userDao = new UserDao(session);
			return userDao.findById(id);
		}
		
		catch(Exception e) {
			e.printStackTrace();	
		}
		return null;
	}
	
	@POST
	@Consumes({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })//Format de données autorisé
	@Produces({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })//Format de retour attendu
	public User addUser(User user) {
		
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			UserDao userDao = new UserDao(session);
			int id = userDao.save(user);
			user.setId(id);
			return user ;
		}
		
		catch(Exception e) {
			e.printStackTrace();	
		}
		return null;
	}
	
	@PUT
	@Path("/{id}")
	@Consumes({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })//Format de données autorisé
	@Produces({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })//Format de retour attendu
	public User updatetUser(@PathParam(value = "id") int id, User user) {
		
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			UserDao userDao = new UserDao(session);
			User currentUser = userDao.findById(id);
			user.setId(id);
			System.out.println(user.getEmail());
			if(user.getEmail() == null) user.setEmail(currentUser.getEmail());
			if(user.getPassword() == null) user.setPassword(currentUser.getPassword());
			if(user.getRole() == null) user.setRole(currentUser.getRole());
		/*user = new User((user.getEmail() != null ? user.getEmail() : currentUser.getEmail()),
					(user.getPassword() != null ? user.getPassword() : currentUser.getPassword()),
					(user.getRole() != null ? user.getRole() : currentUser.getRole()));*/
			
			userDao.update(user);
			System.out.println(user.getEmail());
			return user;
		}
		
		catch(Exception e) {
			e.printStackTrace();	
		}
		return null;
		
	}
	
	@DELETE
	@Path("/{id}")
	@Consumes({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })//Format de données autorisé
	@Produces({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })//Format de retour attendu
	public void deletetUser(@PathParam(value = "id") int id) {
		
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			UserDao userDao = new UserDao(session);
			User user = userDao.findById(id);
			userDao.delete(user);
		}
		
		catch(Exception e) {
			e.printStackTrace();	
		}		
	}
	
	@GET
	@Produces({ MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML })
	@Path("/findBy")
	@DefaultValue("USER")
	public List<User> getUsersByRole(@QueryParam(value = "role") String role) {
	
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			UserDao userDao = new UserDao(session);
			return userDao.findAll().stream().filter(u -> u.getRole() == role)
					.collect(Collectors.toList());
		}
		
		catch(Exception e) {
			e.printStackTrace();	
		}
		return null;
	}
}