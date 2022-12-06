package com.manage.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.manage.dto.CustomerDto;
import com.manage.dto.UpdateDto;
import com.manage.entity.Complaint;
import com.manage.entity.Customer;
import com.manage.entity.ReponseData;
import com.manage.export.ComplaintDataExporter;
import com.manage.services.ComplaintService;
import com.manage.services.CustomerService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	Logger log = Logger.getLogger(AdminController.class);

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ComplaintService complaintService;

	public AdminController() {
		super();
	}

	// Admin Dashboard
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session, Principal p) {
		List<Complaint> fetchAll = this.complaintService.getAllComplents();
		log.info("Admin get Login");
		model.addAttribute("fetchAll", fetchAll);
		session.setAttribute("session", p.getName());
		return "dashboard";
	}

	// Get Update complaint Form For Admin
	@GetMapping("/updateComplaint")
	public String updateComplaint(@RequestParam("complaintId") int complaintId, Model m) {
		Complaint complaint = this.complaintService.getComplaintById(complaintId);
		log.info("Admin get Update Form for Complaint Response");
		m.addAttribute("complaint", complaint);
		return "adminResponse";
	}

	// Edit Complaint By Admin
	@PostMapping("/updateform")
	public @ResponseBody ReponseData updateForm(@RequestBody UpdateDto updateDto) {
		Complaint complaint = this.complaintService.getComplaintById(updateDto.getComplaintId());
		System.out.println(complaint);
		updateDto.setCatagary(complaint.getCatagary());
		updateDto.setProduct(complaint.getProduct());
		updateDto.setProductCatagary(complaint.getProductCatagary());
		updateDto.setComplaintDescription(complaint.getComplaintDescription());
		this.complaintService.updateComplaint(updateDto);
		log.info("Admin Submited Complaint Response By Form");
		return new ReponseData("SUCCESS");
	}

	// Get Total History For Customer
	@GetMapping("/totalHistory")
	public String complaintHistory(@RequestParam(required = false, name = "search") String search, Model model,
			Principal p, HttpSession session) {
		// for Search
		if (search != null) {
			log.info("Complaint Search By Admin");
			model.addAttribute("totalHistory", this.complaintService.getComplaintBySearch(search));
			return "totalHistory";
		}

		log.info("Complaint History Admin");
		List<Complaint> totalHistory = this.complaintService.getHistory();
		session.setAttribute("session", p.getName());
		model.addAttribute("totalHistory", totalHistory);
		return "totalHistory";
	}

	// Download The Excel Sheet
	@GetMapping("/excel")
	public void exportToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octect-strem");
		String headerKey = "Content-Dispoition";
		String headerValue = "attachment;filename=Complaint_History.xlsx";
		response.setHeader(headerKey, headerValue);
		List<Complaint> listComplaint = complaintService.getExcel();
		ComplaintDataExporter exporter = new ComplaintDataExporter(listComplaint);
		log.info("Complaint Download By Excel");
		exporter.export(response);

	}

	// Get The Details Of Customer
	@GetMapping("/adminProfile")
	public String userProfile(Model model, Principal p) {
		Customer customer = this.customerService.getCustomerByEmail(p.getName());
		log.info("Open Admin Profile");
		model.addAttribute("customerDetails", customer);
		return "adminProfile";
	}

	// Get Update Form For Customer
	@GetMapping("/editAdmin")
	public String editCustomer(@RequestParam("customerId") Integer customerId, Model m) {
		Customer customer = this.customerService.getCustomerById(customerId);
		log.info("Open Admin Details Update Form ");
		m.addAttribute("customer", customer);
		return "editAdmin";
	}

	// Edit Costumer Form
	@PostMapping("/updateAdmin")
	public @ResponseBody ReponseData updateCustomer(@RequestBody CustomerDto customerDto) {
		Customer customer = this.customerService.getCustomerById(customerDto.getCustomerId());
		customerDto.setEmail(customer.getEmail());
		customerDto.setPassword(customer.getPassword());
		customerDto.setRole(customer.getRole());
		this.customerService.updateCustomer(customerDto);
		log.info(" Admin Details Updated");
		return new ReponseData("SUCCESS");
	}

}
