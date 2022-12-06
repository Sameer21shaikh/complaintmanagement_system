package com.manage.controller;

import javax.persistence.EntityExistsException;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.manage.dto.CustomerDto;
import com.manage.services.CustomerService;

@Controller
public class HomeController {

	Logger log = Logger.getLogger(HomeController.class);

	@Autowired
	private CustomerService customerService;

	public HomeController() {
		super();
	}

	// get Index Page
	@GetMapping("/index")
	public String index() {
		log.info("Get Index Page");
		return "index";
	}

	// get Register Page
	@GetMapping("/register")
	public String register(HttpSession session) {
		session.invalidate();
		log.info("Get Register Page");
		return "register";
	}

	// get Login Page
	@GetMapping("/login")
	public String login() {
		log.info("Get Login Page");
		return "login";
	}

	// Post Register User
	@PostMapping("register")
	public String registerCustomer(CustomerDto customerDto, Model model) {
		if (this.customerService.registerUser(customerDto)) {
			log.info("User Registerd");
			return "redirect:login";
		} else {
			model.addAttribute("msg", "email already exists");
			log.warn("email already exists", new EntityExistsException());
			return "redirect:register?msg=User Already Exist";

		}
	}

}
