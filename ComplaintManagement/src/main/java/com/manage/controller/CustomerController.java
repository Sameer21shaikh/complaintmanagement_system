package com.manage.controller;

import java.security.Principal;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.manage.dto.ComplaintDto;
import com.manage.dto.CustomerDto;
import com.manage.dto.UpdateDto;
import com.manage.entity.Complaint;
import com.manage.entity.Customer;
import com.manage.entity.ReponseData;
import com.manage.services.ComplaintService;
import com.manage.services.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	Logger log = Logger.getLogger(CustomerController.class);

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ComplaintService complaintService;

	public CustomerController() {
		super();

	}

	// Get Login Page
	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/complaint") // Get Customer Dashboard
	public String complaint(Model model, Principal p, HttpSession session) {
		Customer customer = this.customerService.getCustomerByEmail(p.getName());
		log.info("Customer get Login");
		session.setAttribute("session", p.getName());

		List<Complaint> inProcessComplaint = this.complaintService.getComplaintByCustomerId(customer);
		model.addAttribute("inprocess", inProcessComplaint.size());
		List<Complaint> solvedComplaint = this.complaintService.getSolvedComplaint(customer);
		model.addAttribute("solved", solvedComplaint.size());
		List<Complaint> totalComplaint = this.complaintService.getComplaintHistory(customer);
		model.addAttribute("total", totalComplaint.size());

		model.addAttribute("complaintList", inProcessComplaint);

		return "complaint";
	}

	@PostMapping("/complaint") // Add The Complaint By Customer
	public @ResponseBody ReponseData addComplaint(@RequestBody ComplaintDto complaintDto, Principal p, Model model) {

		Customer customer = this.customerService.getCustomerByEmail(p.getName());
		complaintDto.setCustomer(customer);
		boolean saveComplaint = this.complaintService.saveComplaint(complaintDto);
		model.addAttribute("complaint", saveComplaint);
		return new ReponseData("success");

	}

	@GetMapping("/history") // Get The History For Customer
	public String complaintHistory(@RequestParam(required = false, name = "search") String search, Model model,
			Principal p, HttpSession session) {
		session.setAttribute("session", p.getName());
		// for search
		Customer customer = this.customerService.getCustomerByEmail(p.getName());
		if (search != null) {
			log.info("Complaint Search By Customer");
			model.addAttribute("complaintsHistory", this.complaintService.getComplaintBySearch(search));
			return "history";
		}

		List<Complaint> inProcessComplaint = this.complaintService.getComplaintByCustomerId(customer);
		model.addAttribute("inprocess", inProcessComplaint.size());
		List<Complaint> solvedComplaint = this.complaintService.getSolvedComplaint(customer);
		model.addAttribute("solved", solvedComplaint.size());
		List<Complaint> totalComplaint = this.complaintService.getComplaintHistory(customer);
		model.addAttribute("total", totalComplaint.size());
		model.addAttribute("complaintsHistory", totalComplaint);
		log.info("Complaint History Customer");
		return "history";
	}

	@GetMapping("/customerProfile") // Get The Details Of Customer
	public String userProfile(Model model, Principal p) {
		Customer customer = this.customerService.getCustomerByEmail(p.getName());
		log.info("Open Customer Profile");
		model.addAttribute("customerDetails", customer);
		return "customerProfile";
	}

	@GetMapping("/editComplaint") // Get Update Form For Complaint
	public String editComplaint(@RequestParam("complaintId") int complaintId, Model m) {
		Complaint complaint = this.complaintService.getComplaintById(complaintId);
		log.info("Customer get Update Form for Complaint");
		m.addAttribute("complaint", complaint);
		return "editComplaint";
	}

	@PostMapping("/editform") // Edit Complaint Form
	public @ResponseBody ReponseData updateForm(@RequestBody UpdateDto updateDto) {
		Complaint complaint = this.complaintService.getComplaintById(updateDto.getComplaintId());
		updateDto.setComments(complaint.getSupport().getComments());
		updateDto.setStatus(complaint.getSupport().getStatus());
		System.out.println(updateDto);
		this.complaintService.updateComplaint(updateDto);
		log.info("Customer Submited edited Complaint");
		return new ReponseData("SUCCESS");
	}

	@GetMapping("/editCustomer") // Get Update Form For Customer
	public String editCustomer(@RequestParam("customerId") Integer customerId, Model m) {
		Customer customer = this.customerService.getCustomerById(customerId);
		log.info("Open Customer Details Update Form ");
		m.addAttribute("customer", customer);
		return "editCustomer";
	}

	@PostMapping("/updateCustomer") // Edit Costumer Form
	public @ResponseBody ReponseData updateCustomer(@RequestBody CustomerDto customerDto) {
		Customer customer = this.customerService.getCustomerById(customerDto.getCustomerId());
		customerDto.setEmail(customer.getEmail());
		customerDto.setPassword(customer.getPassword());
		customerDto.setRole(customer.getRole());
		this.customerService.updateCustomer(customerDto);
		log.info(" Customer Details Updated");
		return new ReponseData("SUCCESS");
	}

	@PostMapping("/deleteComplaint") // Delete Complaint From Customer
	public @ResponseBody ReponseData deleteComplaint(@RequestBody String complaintId) {
		JSONObject jsonObject = new JSONObject(complaintId);
		int complaintDelete = jsonObject.getInt("complaintId");

		if (this.complaintService.deleteComplainByCustomer(complaintDelete)) {
			log.info(" Customer Deleted");
			return new ReponseData("SUCCESS");
		} else {
			return new ReponseData("ERROR");
		}
	}

//	@PostMapping("/getInprocessCount") // Delete Complaint From Customer
//	public @ResponseBody ReponseData inProcessCount(@RequestBody String complaintId) {
//		JSONObject jsonObject = new JSONObject(complaintId);
//		long inProcessCount = jsonObject.getInt("complaintId");
//
//		if (this.complaintService.getCountInProcess(inProcessCount)) {
//			return new ReponseData("SUCCESS");
//		} else {
//			return new ReponseData("ERROR");
//		}
//	}

}
