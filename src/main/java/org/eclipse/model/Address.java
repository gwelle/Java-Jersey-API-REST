package org.eclipse.model;

import java.util.List;

import jakarta.json.bind.annotation.JsonbNillable;
import jakarta.json.bind.annotation.JsonbProperty;
import jakarta.json.bind.annotation.JsonbPropertyOrder;
import jakarta.json.bind.annotation.JsonbTransient;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="location")
@JsonbPropertyOrder({"num", "street", "postalCode", "city", "users"})
@JsonbNillable
public class Address {
	
	@Id
	@GeneratedValue (strategy=GenerationType.IDENTITY)
	@JsonbProperty("num")
	private int id ;
	private String street;
	
	@JsonbProperty("postalCode")
	private String zipCode ;
	private String city ;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
	@JoinTable(name="persons_location",joinColumns=@JoinColumn(name="addresses_id"),
	inverseJoinColumns=@JoinColumn(name="users_id"))
	@JsonbTransient
    private List<User> users;
	
	public Address() {}

	public Address(String street, String zipCode, String city) {
		super();
		this.street = street;
		this.zipCode = zipCode;
		this.city = city;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}


	public String getZipCode() {
		return zipCode;
	}


	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}

	public List<User> getUsers() {
		return users;
	}


	public void setUsers(List<User> users) {
		this.users = users;
	}


	public void add(User user) {
		users.add(user);
		user.getAddresses().add(this);
	}

	public void remove(User user) {
		users.remove(user);
		user.getAddresses().remove(this);
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", street=" + street + ", zipCode=" + zipCode + ", city=" 
				+ city + ", users=" + users + "]";
	}
}
