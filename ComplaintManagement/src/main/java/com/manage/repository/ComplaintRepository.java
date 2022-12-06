package com.manage.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.manage.entity.Complaint;
import com.manage.entity.Customer;

public interface ComplaintRepository extends JpaRepository<Complaint, Integer> {

	// Customer Inprocess Complaint
	@Query(nativeQuery = true, value = "SELECT * FROM complaint WHERE comments ='INPROCESS' AND status ='INPROCESS' AND customerId=? ")
	public List<Complaint> getInProcessComplaint(Customer customer);

	@Query(nativeQuery = true, value = "SELECT * FROM complaint WHERE status ='SOLVED' AND customerId=? ")
	public List<Complaint> getSolvedComplaint(Customer customer);

	// Admin Dashboard
	@Query(nativeQuery = true, value = "SELECT * FROM complaint WHERE comments ='INPROCESS' AND status ='INPROCESS'")
	public List<Complaint> findBySupport();

	// History for Customer
	@Query(nativeQuery = true, value = "SELECT * FROM concerto.complaint WHERE customerId=? ORDER BY Date DESC ")
	public List<Complaint> findAllComplaintByCustomer(Customer customer);

	// History for Admin
	@Query(nativeQuery = true, value = "SELECT * FROM concerto.complaint ORDER BY Date DESC")
	public List<Complaint> findCustomerByOrder();

	@Query(nativeQuery = true, value = "SELECT * FROM complaint WHERE customerId=? ")
	public List<Complaint> getComplaintProfile(Customer customer);

	public List<Complaint> findByProductContaining(String product);

}
