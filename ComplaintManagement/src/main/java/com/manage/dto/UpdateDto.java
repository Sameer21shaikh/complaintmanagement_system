package com.manage.dto;

import com.manage.entity.ResponceStatus;

public class UpdateDto {

	private int complaintId;
	private String catagary;
	private String product;
	private String productCatagary;
	private String complaintDescription;
	private ResponceStatus status;
	private String comments;
	private int customerId;

	public UpdateDto() {
		super();
	}

	public UpdateDto(int complaintId, String catagary, String product, String productCatagary,
			String complaintDescription, ResponceStatus status, String comments, int customerId) {
		super();
		this.complaintId = complaintId;
		this.catagary = catagary;
		this.product = product;
		this.productCatagary = productCatagary;
		this.complaintDescription = complaintDescription;
		this.status = status;
		this.comments = comments;
		this.customerId = customerId;
	}

	@Override
	public String toString() {
		return "UpdateDto [complaintId=" + complaintId + ", catagary=" + catagary + ", product=" + product
				+ ", productCatagary=" + productCatagary + ", complaintDescription=" + complaintDescription
				+ ", status=" + status + ", comments=" + comments + ", customerId=" + customerId + "]";
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

	public ResponceStatus getStatus() {
		return status;
	}

	public void setStatus(ResponceStatus status) {
		this.status = status;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

}
