package com.manage.dto;

import com.manage.entity.Customer;
import com.manage.entity.Support;

public class ComplaintDto {

	private int complaintId;
	private String catagary;
	private String product;
	private String productCatagary;
	private String complaintDescription;
	private Support support;
	private Customer customer;

	public ComplaintDto() {
		super();
	}

	public ComplaintDto(int complaintId, String catagary, String product, String productCatagary,
			String complaintDescription, Support support, Customer customer) {
		super();
		this.complaintId = complaintId;
		this.catagary = catagary;
		this.product = product;
		this.productCatagary = productCatagary;
		this.complaintDescription = complaintDescription;
		this.support = support;
		this.customer = customer;
	}

	@Override
	public String toString() {
		return "ComplaintDto [complaintId=" + complaintId + ", catagary=" + catagary + ", product=" + product
				+ ", productCatagary=" + productCatagary + ", complaintDescription=" + complaintDescription
				+ ", support=" + support + ", customer=" + customer + "]";
	}

	public int getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
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
