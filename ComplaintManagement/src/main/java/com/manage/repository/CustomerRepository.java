package com.manage.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.manage.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {

	// Check The Customer Exist or not
	public boolean existsByEmail(String email);

	// Find the Existing Customer
	public Optional<Customer> findByEmail(String email);

	// Find All The Customer
	public boolean findAllByUsername(String customerDto);

	public Optional<Customer> findByUsername(String userName);

}
