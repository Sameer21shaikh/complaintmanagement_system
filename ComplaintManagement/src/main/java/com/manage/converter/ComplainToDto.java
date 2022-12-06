package com.manage.converter;

import com.manage.dto.ComplaintDto;
import com.manage.dto.UpdateDto;
import com.manage.entity.Complaint;
import com.manage.entity.Customer;
import com.manage.entity.Support;

public class ComplainToDto {

	private ComplainToDto() {
		throw new IllegalStateException("ComplainToDto class");
	}

	public static Complaint convertDtoToEntity(ComplaintDto complaintDto) {
		Complaint complaints = new Complaint();
		complaints.setComplaintId(complaintDto.getComplaintId());
		complaints.setCatagary(complaintDto.getCatagary());
		complaints.setProduct(complaintDto.getProduct());
		complaints.setProductCatagary(complaintDto.getProductCatagary());
		complaints.setComplaintDescription(complaintDto.getComplaintDescription());
		complaints.setCustomer(complaintDto.getCustomer());
		complaints.setSupport(complaintDto.getSupport());
		return complaints;
	}

	public static Complaint updateComplaintDtoToEntity(UpdateDto updateDto) {
		Complaint complaint = new Complaint();
		complaint.setComplaintId(updateDto.getComplaintId());
		complaint.setCatagary(updateDto.getCatagary());
		complaint.setProduct(updateDto.getProduct());
		complaint.setProductCatagary(updateDto.getProductCatagary());
		Support support = new Support();
		support.setStatus(updateDto.getStatus());
		support.setComments(updateDto.getComments());
		complaint.setSupport(support);
		complaint.setComplaintDescription(updateDto.getComplaintDescription());
		Customer customer = new Customer();
		customer.setCustomerId(updateDto.getCustomerId());
		complaint.setCustomer(customer);

		return complaint;
	}

}
