package com.manage.converter;

import com.manage.dto.CustomerDto;
import com.manage.entity.Customer;

public class CustomerToDto {

	private CustomerToDto() {
		throw new IllegalStateException("CustomerToDto class");
	}

	public static Customer customerData(CustomerDto customerDto) {
		Customer customer = new Customer();
		customer.setCustomerId(customerDto.getCustomerId());
		customer.setUsername(customerDto.getUsername());
		customer.setEmail(customerDto.getEmail());
		customer.setContact(customerDto.getContact());
		customer.setPassword(customerDto.getPassword());
		customer.setAddress(customerDto.getAddress());
		customer.setRole(customerDto.getRole());
		return customer;

	}

}
