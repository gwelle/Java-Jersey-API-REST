package org.eclipse.model;

import java.security.Principal;
import java.util.List;

import jakarta.json.bind.annotation.JsonbNillable;
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
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;
import jakarta.xml.bind.annotation.XmlType;
import jakarta.xml.bind.annotation.XmlValue;

@XmlRootElement(name="users")
//@XmlType(propOrder = {"email","password","role","id"})
@Entity
@Table(name="persons")
@JsonbPropertyOrder({"id", "email", "role", "addresses"})
@JsonbNillable
public class User implements Principal {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id ;
	
	private String email;
	
	@JsonbTransient
	private String password ;
	
	private String role ;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
	@JoinTable(name="persons_location",joinColumns=@JoinColumn(name="users_id"),
	inverseJoinColumns=@JoinColumn(name="addresses_id"))
	private List<Address> addresses;
	
	public User() {}
	
	public User(String email, String password, String role) {
		this.email = email;
		this.password = password;
		this.role = role;
	}

	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	//@XmlAttribute(name = "id")
	//@XmlTransient
	public void setId(int id) {
		this.id = id;
	}

	//@XmlValue
	public String getEmail() {
		return email;
	}
	
	//@XmlElement(name = "login")
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}
	
	public void addAddress(Address address) {
		addresses.add(address);
		address.getUsers().add(this);
	}

	public void removeAddress(Address address) {
		addresses.remove(address);
		address.getUsers().remove(this);
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", password=" + password + ", role=" + role 
				+ ", addresses=" + addresses + "]";
	}

	@Override
	public String getName() {
		return email;
	}
}
