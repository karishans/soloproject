package com.karis.soloproject.controllers;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	private String IMAGE_FOLDER="src/main/resources/static/imgs/";
	
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
		System.out.println(pet.getMissingpet());		
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
	public String createPet(@Valid @ModelAttribute("newPet") Pet pet, BindingResult result, @RequestParam("pic") MultipartFile file, HttpSession session, Model model) {
		if(file.isEmpty()) {
			System.err.println("no file");
		}else {
			System.out.println(file.getOriginalFilename());
			try {
				byte[] bytes = file.getBytes();
//				Path path=Paths.get(IMAGE_FOLDER +file.getOriginalFilename());
				Path uploadPath = Paths.get(IMAGE_FOLDER);
				Path filePath = uploadPath.resolve(StringUtils.cleanPath(file.getOriginalFilename()));
				Files.copy(file.getInputStream(),filePath, StandardCopyOption.REPLACE_EXISTING);
				FileOutputStream output = new FileOutputStream(IMAGE_FOLDER+file.getOriginalFilename());
				output.write(file.getBytes());
				pet.setPetUrl("/imgs/" +file.getOriginalFilename());	
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(result.hasErrors()) {
			model.addAttribute("now", now());
			return "newPet.jsp";
		}else {
			System.err.println(pet.getPetUrl());
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
			return "petprofile.jsp";
		}else {
			return "redirect:/login";
		}
	}
	
	//Add Message Comment on Pet Page
	@PostMapping("/pets/{petId}/comment")
	public String comment(@RequestParam("message") String message, @PathVariable("petId") Long petId, HttpSession session, RedirectAttributes redirs, Model model) {
		Long userId = (Long)session.getAttribute("userId");
		User loggedInUser = userService.findById(userId);
		Pet pet = petService.findPet(petId);
		if(userId==null) {
			return "redirect:/login";
		}
		if(message.equals("")) {
			model.addAttribute("pet", pet);
			model.addAttribute("loggedInUser", loggedInUser);
			redirs.addFlashAttribute("error", "comment cannot be blank");
			return "redirect:/pets/{petId}";
		}
		petService.comment(loggedInUser, pet, message);
		return "redirect:/pets/{petId}";
	}
	
	//Edit Pet Page
	@GetMapping("/pets/edit/{petId}")
	public String editPet(HttpSession session, @ModelAttribute("editedPet") Pet pet, Model model, @PathVariable("petId") Long petId) {
		Pet oldPet = petService.findPet(petId);
		Long userId = oldPet.getOwner().getId();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String birthday =df.format(oldPet.getBirthday());
		Long sessionId = (Long)session.getAttribute("userId");
		if(userId.equals(sessionId)) {
			model.addAttribute("oldPet", oldPet);
			model.addAttribute("birthday", birthday);
			return "editPet.jsp";
		}else {
			return "redirect:/login";
		}
	}
	
	//Edit Pet Profile
	@PostMapping("/pets/update/{petId}")
	public String updatePet(@Valid @ModelAttribute("editedPet") Pet pet, BindingResult result, Model model, @PathVariable("petId") Long petId) {
		if(result.hasErrors()) {
			model.addAttribute("oldPet",petService.findPet(petId));
			return "editPet.jsp";
		}else {
			petService.updatePet(pet);
			return "redirect:/dashboard";
		}
	}
	
	//Delete pet profile
	@GetMapping("/pets/delete/{petId}")
	public String deletePet(@PathVariable("petId") long petId, HttpSession session) {
		Pet pet = petService.findPet(petId);
		Long userId = pet.getOwner().getId();
		Long sessionId = (Long)session.getAttribute("userId");
		if(userId.equals(sessionId)) {
			petService.deletePet(petId);
			return "redirect:/dashboard";
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
			model.addAttribute("pet",petService.findPet(id));			
			return "newMissingPet.jsp";
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
	
	//Edit Missing Pet Page
	@GetMapping("/missing/edit/{missingpetId}")
	public String editMissingPet(HttpSession session, @ModelAttribute("editedPet") MissingPet missingPet, Model model, @PathVariable("missingpetId") Long missingpetId) {
		MissingPet oldmissingPet = petService.getMissingPet(missingpetId);
		Long petId = oldmissingPet.getPet().getId();
		Pet pet = oldmissingPet.getPet();
		Long userId = oldmissingPet.getParent().getId();
		Long sessionId = (Long)session.getAttribute("userId");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String lastseen =df.format(oldmissingPet.getLastseen());
		if(userId.equals(sessionId)) {
			model.addAttribute("oldmissingPet", oldmissingPet);
			model.addAttribute("petId", petId);
			model.addAttribute("pet",pet);
			model.addAttribute("states", State.States);
			model.addAttribute("lastseen", lastseen);
			return "editMissingPet.jsp";
		}else {
			return "redirect:/login";
		}
	}
	
	
	//Edit Missing Pet Profile
	@PostMapping("/missing/update/{missingpetId}")
	public String updateMissingPet(@Valid @ModelAttribute("editedPet") MissingPet pet, BindingResult result, Model model, @PathVariable("missingpetId") Long missingpetId) {
		if(result.hasErrors()) {
			model.addAttribute("oldmissingPet",petService.getMissingPet(missingpetId));
			model.addAttribute("states", State.States);
			return "editMissingPet.jsp";
		}else {
			petService.updateMissingPet(pet);
			return "redirect:/missing/pets";
		}
	}
	//Delete MissingPet profile
	@GetMapping("/missing/delete/{petId}")
	public String deleteMissingPet(@PathVariable("petId") long petId, HttpSession session) {
		MissingPet missingPet = petService.getMissingPet(petId);
		Long userId = missingPet.getParent().getId();
		Long sessionId = (Long)session.getAttribute("userId");
		if(userId.equals(sessionId)) {
			petService.deleteMissingPet(petId);
			return "redirect:/dashboard";
		}else {
			return "redirect:/login";
		}
		
	}
}






