package com.karis.soloproject.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.karis.soloproject.models.State;
import com.karis.soloproject.models.User;
import com.karis.soloproject.services.UserService;
import com.karis.soloproject.validator.UserValidator;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserValidator userValidator;
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
	//Registration page
	@GetMapping("/register")
	public String register(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("states",State.States);
		return "register.jsp";
	}
	
	//Register a User
	@PostMapping("/registration")
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult results,
			HttpSession session, Model model) {
			userValidator.validate(user,results);
		
		if(results.hasErrors()) {
			model.addAttribute("states",State.States);
			return "register.jsp";
		}else {
			//register the new user
			User newUser=userService.registerUser(user);
			//put userId into session
			session.setAttribute("userId", newUser.getId());
			session.setAttribute("userName", newUser.getFirstName());
			
			return "redirect:/dashboard";
		}
	}
	
	//Login page
	@GetMapping("/login")
	public String login() {
		return "login.jsp";
	}
	
	//login user
	@PostMapping("/loginUser")
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, RedirectAttributes redirectAttributes) {
		//if the user is authenticated, save their user id in session
		if(userService.authenticateUser(email, password)) {
			User user=userService.findByEmail(email);
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getFirstName());
			return "redirect:/dashboard";
		}else {
			
			redirectAttributes.addFlashAttribute("error", "Invalid user/password");
			return "redirect:/login";
		}
	}
	//logout user
	@GetMapping("/logout")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
