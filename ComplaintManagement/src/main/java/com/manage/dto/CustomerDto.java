package com.manage.dto;

import java.util.List;
import com.manage.entity.Complaint;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class CustomerDto {

	private int customerId;
	private String username;
	private String email;
	private String contact;
	private String password;
	private String address;
	private List<Complaint> complaint;

	private String role;

	public CustomerDto() {
		super();
	}

	public CustomerDto(int customerId, String username, String email, String contact, String password, String address,
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "CustomerDto [customerId=" + customerId + ", username=" + username + ", email=" + email + ", contact="
				+ contact + ", password=" + password + ", address=" + address + ", complaint=" + complaint + ", role="
				+ role + "]";
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
