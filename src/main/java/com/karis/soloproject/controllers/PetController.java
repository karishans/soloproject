package com.karis.soloproject.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.karis.soloproject.models.State;
import com.karis.soloproject.models.MissingPet;
import com.karis.soloproject.models.Pet;
import com.karis.soloproject.models.User;
import com.karis.soloproject.services.PetService;
import com.karis.soloproject.services.UserService;

@Controller
public class PetController {
	@Autowired
	private UserService userService;
	@Autowired
	private PetService petService;
	
	private String now() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(new Date());
	}
	
	//Dashboard Route
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		//if a user is in session
		if(session.getAttribute("userId")!=null) {
			User user =userService.findById((Long)session.getAttribute("userId"));
			List<Pet> petsOwned = user.getPetsOwned();
			model.addAttribute("user", user);
			model.addAttribute("petsOwned", petsOwned);
			return "dashboard.jsp";
						
		}else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/dashboard/pet")
	public String showOnePet(@RequestParam("petName") Long petId, Model model, HttpSession session) {
		User user =userService.findById((Long)session.getAttribute("userId"));
		Pet pet = petService.findPet(petId);
		model.addAttribute("user", user);
		model.addAttribute("pet", pet);
		
		return "dashboardPet.jsp";
	}
	
	@GetMapping("/pets/new")
	public String newPet(HttpSession session, @ModelAttribute("newPet") Pet pet, Model model) {
		if(session.getAttribute("userId")!=null) {
			model.addAttribute("now", now());
			return "newPet.jsp";
		}else {
			return "redirect:/login";
		}
	
	}
	
	@PostMapping("/pets/create")
	public String createPet(@Valid @ModelAttribute("newPet") Pet pet, BindingResult result, HttpSession session, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("now", now());
			return "newPet.jsp";
		}else {
			petService.createPet(pet);
			return "redirect:/dashboard";
		}
	}
	
	//Show Pet profile
	@GetMapping("/pets/{petId}")
	public String showPet(@PathVariable("petId") Long id, HttpSession session, Model model) {
		if(session.getAttribute("userId")!=null) {
			User loggedInUser =userService.findById((Long)session.getAttribute("userId"));
			Pet pet = petService.findPet(id);
			
			model.addAttribute("pet", pet);
			model.addAttribute("loggedInUser", loggedInUser);
			return "show.jsp";
		}else {
			return "redirect:/login";
		}
	}
	
	//New Missing Pet 
	@GetMapping("/missing/create/{petId}")
	public String newMissing(@PathVariable("petId") Long id, HttpSession session, @ModelAttribute("newMissingPet") MissingPet missingPet, Model model) {
		if(session.getAttribute("userId")!=null) {
			model.addAttribute("now", now());
			model.addAttribute("states",State.States);
			model.addAttribute("petId", id);
			model.addAttribute("pet",petService.findPet(id));			return "newMissingPet.jsp";
		}else {
			return "redirect:/login";
		}
	}
	
	//Create Missing Pet
	@PostMapping("/missing/create")
	public String createMissingPet(@Valid @ModelAttribute("newMissingPet") MissingPet missingPet, BindingResult result, HttpSession session, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("now", now());
			model.addAttribute("states",State.States);
			return "newMissingPet.jsp";
		}else {
			petService.createMissingPet(missingPet);
			//Later return to missing pet page
			return "redirect:/missing/pets";
		}
	}
	
	//Missing Pet Dashboard 
	@GetMapping("/missing/pets")
	public String getMissingPets(Model model) {
		List<MissingPet> missingPets = petService.allMissing();
		model.addAttribute("missingPets", missingPets);
		model.addAttribute("states",State.States);
		return "missingDashboard.jsp";
	}
	
	//Post Mapping Route to search for state (request param)
	@GetMapping("/missing/state")
	public String showPetState(@RequestParam("state") String state, Model model) {
		List<MissingPet> missingPets= petService.findPetByState(state);
		model.addAttribute("missingPets", missingPets);
		model.addAttribute("states",State.States);
		return "missingDashboard.jsp";
	}
	
	
}






