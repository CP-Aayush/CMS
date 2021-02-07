package com.aayush.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aayush.bean.Emp;
import com.aayush.dao.EmpDao;

@Controller
public class DemoController {

	@Autowired
	EmpDao dao;

	@GetMapping("/")
	public String showHome(Model m, Authentication authentication) {
		List<Emp> list = dao.getEmployees();
		List<Emp> myList = dao.getMyRequests(authentication.getName());
		List<Emp> assignedToMe = dao.assigned(authentication.getName());
		m.addAttribute("list", list);
		m.addAttribute("myList", myList);
		m.addAttribute("assignedToMe", assignedToMe);
		return "home";
	}

	@GetMapping("/newRequest1")
	public String newRequest() {
		return "newRequest1";
	}

	@GetMapping("/newRequest")
	public String newRequest0() {
		return "newRequest";
	}

	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String save(@ModelAttribute("emp") Emp emp) {
		dao.save(emp);

		return "redirect:/";
	}

	@GetMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {

			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "fancy-login";// You can redirect wherever you want, but generally it's a good practice to
		// show login screen again.
	}

	@GetMapping(value = "editOpen/{requestId}")
	public String editOpen(@PathVariable int requestId, Model m) {
		int emp = dao.changeStatusOpen(requestId);
		return "redirect:/";
	}

	@GetMapping(value = "editClose/{requestId}")
	public String editClose(@PathVariable int requestId, Model m) {
		int emp = dao.changeStatusClose(requestId);
		return "redirect:/";
	}

	@GetMapping(value = "assignManager/{requestId}")
	public String assignManager(@PathVariable int requestId,Model m) {
		List<Emp> mgr = dao.getManagers();
		m.addAttribute("mgr",mgr);
		m.addAttribute("reqId",requestId);
		//		dao.assignManager(requestId);
		return "assign";
	}
	
	@RequestMapping(value = "assignManager/assignMgr", method = RequestMethod.GET)
	public String assignMgr(@ModelAttribute("emp") Emp emp) {
		System.out.println("I am here");
		dao.assignManager(emp);

		return "redirect:/";
	}

}
