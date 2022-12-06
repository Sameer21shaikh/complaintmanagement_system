package com.manage.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Complaint {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int complaintId;

	@Column(name = "Date", nullable = false, columnDefinition = "TIMESTAMP default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP")
	private Date complaintDate = new Date();

	@Column(nullable = false)
	private String catagary;

	@Column(nullable = false)
	private String product;

	@Column(nullable = false)
	private String productCatagary;

	@Column(length = 150)
	private String complaintDescription;

	@Embedded
	private Support support;

	@ManyToOne
	@JoinColumn(name = "customerId", nullable = false)
	private Customer customer;

	public Complaint() {
		super();
	}

	public Complaint(int complaintId, Date complaintDate, String catagary, String product, String productCatagary,
			String complaintDescription, Support support, Customer customer) {
		super();
		this.complaintId = complaintId;
		this.complaintDate = complaintDate;
		this.catagary = catagary;
		this.product = product;
		this.productCatagary = productCatagary;
		this.complaintDescription = complaintDescription;
		this.support = support;
		this.customer = customer;
	}

	@Override
	public String toString() {
		return "Complaint [complaintId=" + complaintId + ", complaintDate=" + complaintDate + ", catagary=" + catagary
				+ ", product=" + product + ", productCatagary=" + productCatagary + ", complaintDescription="
				+ complaintDescription + ", support=" + support + "]";
	}

	public int getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}

	public Date getComplaintDate() {
		return complaintDate;
	}

	public void setComplaintDate(Date complaintDate) {
		this.complaintDate = complaintDate;
	}

	public String getCatagary() {
		return catagary;
	}

	public void setCatagary(String catagary) {
		this.catagary = catagary;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getProductCatagary() {
		return productCatagary;
	}

	public void setProductCatagary(String productCatagary) {
		this.productCatagary = productCatagary;
	}

	public String getComplaintDescription() {
		return complaintDescription;
	}

	public void setComplaintDescription(String complaintDescription) {
		this.complaintDescription = complaintDescription;
	}

	public Support getSupport() {
		return support;
	}

	public void setSupport(Support support) {
		this.support = support;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}
