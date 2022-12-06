package com.manage.services;

import java.util.Optional;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.manage.converter.CustomerToDto;
import com.manage.dto.CustomerDto;
import com.manage.entity.Customer;
import com.manage.repository.CustomerRepository;

@Service
public class CustomerService {

	Logger log = Logger.getLogger(CustomerService.class);

	@Autowired
	private CustomerRepository customerRepository;

	// Register User
	public boolean registerUser(CustomerDto customerDto) {

		try {
			PasswordEncoder myEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			Customer customer = CustomerToDto.customerData(customerDto);
			customer.setRole("ROLE_CUSTOMER");
			customer.setPassword(myEncoder.encode(customer.getPassword()));
			if (this.customerRepository.existsByEmail(customer.getEmail())) {
				throw new EntityExistsException("Customer Username is already exists");
			}
			log.info("Service for insert Customer");
			this.customerRepository.save(customer);
			return customerDto != null;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// Get Customer By Email
	public Customer getCustomerByEmail(String email) {
		Optional<Customer> optionalCustometr = this.customerRepository.findByEmail(email);
		if (optionalCustometr.isPresent()) {
			log.info("Service for get Customer by email" + email);
			return optionalCustometr.get();

		} else {
			log.error("Service for get Customer by email" + email);
			return optionalCustometr
					.orElseThrow(() -> new EntityNotFoundException("Entity with this username not found" + email));
		}
	}

	// Get Complaint By Id
	public Customer getCustomerById(int customerId) {
		Customer customer = this.customerRepository.findById(customerId).get();
		if (customer != null) {
			log.info("Service Get Complaint By Id" + customerId);
			return customer;
		} else {
			log.error("Service Get Complaint By Id" + customerId);
			throw new EntityNotFoundException("Entity with this username not found" + customerId);
		}

	}

	// Update Customer Form
	public boolean updateCustomer(CustomerDto customerDto) {
		try {
			Customer updateCustomer = CustomerToDto.customerData(customerDto);
			this.customerRepository.existsById(updateCustomer.getCustomerId());
			this.customerRepository.save(updateCustomer);
			log.info("Service Update User" + updateCustomer.getCustomerId());
			return true;
		} catch (Exception e) {
			log.error("Service Update User");
			e.printStackTrace();
			return false;

		}

	}

	// Delete Complaint By Id
	public boolean deleteComplainByCustomer(int complaintid) {
		if (this.customerRepository.existsById(complaintid)) {
			this.customerRepository.deleteById(complaintid);
			log.info("Service Delete Complaint By Id" + complaintid);
			return true;
		}
		return false;
	}

}
