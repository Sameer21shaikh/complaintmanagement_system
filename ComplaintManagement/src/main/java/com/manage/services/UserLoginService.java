package com.manage.services;

import java.util.Arrays;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.manage.entity.Customer;
import com.manage.repository.CustomerRepository;

@Service
public class UserLoginService implements UserDetailsService {
	@Autowired
	private CustomerRepository customerRepository;

	@Override // For User Login
	public UserDetails loadUserByUsername(String email) {
		Optional<Customer> optionalCustomer = this.customerRepository.findByEmail(email);
		if (optionalCustomer.isPresent()) {
			return optionalCustomer.map(user -> new User(user.getEmail(), user.getPassword(), Arrays
					.stream(user.getRole().split(",")).map(SimpleGrantedAuthority::new).collect(Collectors.toList())))
					.get();
		}
		throw new UsernameNotFoundException("Username not found");
	}
}
