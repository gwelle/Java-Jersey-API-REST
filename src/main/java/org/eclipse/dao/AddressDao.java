package org.eclipse.dao;

import org.eclipse.model.Address;
import org.hibernate.Session;

public class AddressDao extends GenericDao<Address,Integer> {

	public AddressDao(Session session) {
		super(Address.class, session);
	}
}