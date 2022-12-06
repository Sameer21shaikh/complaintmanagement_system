package com.manage.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int customerId;

	@Column(unique = true)
	private String username;

	@Column(nullable = false, unique = true, length = 25)
	private String email;

	@Column(nullable = false, unique = true, length = 10)
	private String contact;

	@Column(nullable = false)
	private String password;

	@Column(nullable = false)
	private String address;

	@OneToMany(mappedBy = "customer", fetch = FetchType.EAGER)
	private List<Complaint> complaint;

	private String role;

	public Customer() {
		super();
	}

	public Customer(int customerId, String username, String email, String contact, String password, String address,
			String role) {
		super();
		this.customerId = customerId;
		this.username = username;
		this.email = email;
		this.contact = contact;
		this.password = password;
		this.address = address;
		this.role = role;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", username=" + username + ", email=" + email + ", contact="
				+ contact + ", password=" + password + ", address=" + address + ", role=" + role + "]";
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Complaint> getComplaint() {
		return complaint;
	}

	public void setComplaint(List<Complaint> complaint) {
		this.complaint = complaint;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
