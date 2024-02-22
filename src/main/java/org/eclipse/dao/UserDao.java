package org.eclipse.dao;

import org.eclipse.model.User;
import org.hibernate.Session;

public class UserDao extends GenericDao<User,Integer> {

	public UserDao(Session session) {
		super(User.class, session);
	}
}