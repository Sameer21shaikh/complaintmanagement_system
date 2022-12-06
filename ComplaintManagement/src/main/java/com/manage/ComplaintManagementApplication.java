package com.manage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.manage.entity.Customer;
import com.manage.repository.CustomerRepository;

@SpringBootApplication
public class ComplaintManagementApplication {
	@Autowired
	private CustomerRepository customerRepository;

	public static void main(String[] args) {
		SpringApplication.run(ComplaintManagementApplication.class, args);
	}

//	@Bean
	public void initailzie() {

		// Admin data PasswordEncoder
		PasswordEncoder delegatingPasswordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		Customer customer = new Customer(1, "Sameer", "sameer@support.in", "1234567890",
				delegatingPasswordEncoder.encode("123"), "Powai", "ROLE_ADMIN");
		this.customerRepository.save(customer);

	}
}
