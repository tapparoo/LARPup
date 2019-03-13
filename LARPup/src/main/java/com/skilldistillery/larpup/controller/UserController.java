package com.skilldistillery.larpup.controller;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.larpup.data.LarpUpDAO;
import com.skilldistillery.larpup.data.UserDTO;
import com.skilldistillery.larpup.entities.Address;
import com.skilldistillery.larpup.entities.Picture;
import com.skilldistillery.larpup.entities.User;

@RestController
@RequestMapping("user")
public class UserController {
	private EntityManager em;

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = { "displayUser.do" }, method = RequestMethod.GET)
	public ModelAndView userDisplay(int userId) {
		ModelAndView mv = new ModelAndView("userPage");
		System.out.println(dao.findUserById(userId));
		mv.addObject("user", dao.findUserById(userId));
		return mv;
	}

	@RequestMapping(path = { "createUserForm.do" }, method = RequestMethod.GET)
	public ModelAndView creatForm() {
		UserDTO dto = new UserDTO();

		ModelAndView mv = new ModelAndView("userForm");
		mv.addObject("inputDTO", dto);
		mv.addObject("action", "/user/createUser.do");
		return mv;
	}
	
	
	@RequestMapping(path = "updateUserForm.do", method = RequestMethod.GET)
	public ModelAndView updateUserForm(int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView("userPage");
		UserDTO dto = new UserDTO();

		mv.addObject("user", dao.findUserById(userId));
		mv.addObject("userDTO", dto);
		mv.addObject("action", "/user/updateUser.do");
		return mv;
	}
	
	//TODO: update picture/password methods
	
	@RequestMapping(path = "resetPassword.do", method = RequestMethod.POST)
	public ModelAndView resetPassword(int userId, String newPass, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/user/displayUser.do");
		User user = dao.findUserById(userId);
		
		return mv;
	}
	
	@RequestMapping(path = "updateUser.do", method = RequestMethod.POST)
	public ModelAndView updateUser(UserDTO userDTO, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/user/displayUser.do");
		User user = dao.findUserById(userDTO.getId());
		
		Address address = user.getAddress();
		address.setState(userDTO.getState());
		address.setCity(userDTO.getCity());
		address.setZipcode(userDTO.getZipcode());
		address.setStreet(userDTO.getStreet());
		dao.updateAddress(address);
		user.setFirstName(userDTO.getFirstName());
		user.setLastName(userDTO.getLastName());
		user.setNickname(userDTO.getNickname());
		user.setEmail(userDTO.getEmail());
		user.setRole("user");
		user.setBirthDate(userDTO.getBirthDate());
		
		if (dao.updateUser(user)) {
			mv.addObject("userId", user.getId());
		}
		return mv;
	}

	@RequestMapping(path = { "createUser.do" }, method = RequestMethod.POST)
	public ModelAndView addUser(UserDTO inputDTO) {
		ModelAndView mv = new ModelAndView();

		User tempUser = new User();
		tempUser.setFirstName(inputDTO.getFirstName());
		tempUser.setLastName(inputDTO.getLastName());
		tempUser.setNickname(inputDTO.getNickname());
		tempUser.setEmail(inputDTO.getEmail());
		tempUser.setPassword(inputDTO.getPassword());
		tempUser.setRole("user");
		tempUser.setBirthDate(inputDTO.getBirthDate());

		Address tempAddr = new Address();
		tempAddr.setStreet(inputDTO.getStreet());
		tempAddr.setCity(inputDTO.getCity());
		tempAddr.setState(inputDTO.getState());
		tempAddr.setZipcode(inputDTO.getZipcode());

		Picture pic = new Picture();
		pic = dao.findPictureById(1);
		tempUser.setPicture(pic);

		tempUser.setAddress(dao.addAddress(tempAddr));
		mv.addObject("user", dao.addUser(tempUser));
		mv.setViewName("userPage");
		return mv;
	}

	@RequestMapping(path = { "deactivateUser.do" }, method = RequestMethod.GET)
	public ModelAndView deactivateUser(int userId) {
		ModelAndView mv = new ModelAndView("redirect:/user/displayUser.do");
		User user = dao.findUserById(userId);

		user.setActive(false);
		dao.updateUser(user);
		mv.addObject("userId", user.getId());
		
		return mv;
	}
}