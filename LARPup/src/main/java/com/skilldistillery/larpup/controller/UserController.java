package com.skilldistillery.larpup.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = {"displayUser.do"}, method = RequestMethod.GET)
	public ModelAndView userDisplay(int userId) {
		ModelAndView mv = new ModelAndView("userDisplay");
		mv.addObject("user", dao.findUserById(userId));
		return mv;
	}
	@RequestMapping(path = {"createUserForm.do"}, method = RequestMethod.GET)
	public ModelAndView creatForm() {
		UserDTO dto = new UserDTO();
		
		ModelAndView mv = new ModelAndView("userForm");
		mv.addObject("inputDTO", dto);
		mv.addObject("action", "/user/createUser.do");
		return mv;
	}
	
	@RequestMapping(path = {"createUser.do"}, method = RequestMethod.POST)
	public ModelAndView addUser(UserDTO inputDTO) {
		ModelAndView mv = new ModelAndView();
		System.out.println(inputDTO);
		User tempUser = new User();
		
		tempUser.setFirstName(inputDTO.getFirstName());
		tempUser.setLastName(inputDTO.getLastName());
		tempUser.setNickname(inputDTO.getNickname());
		tempUser.setEmail(inputDTO.getEmail());
		tempUser.setPassword(inputDTO.getPassword());
		
		tempUser.setRole("user");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date inputDate = null;
        try {
            inputDate = format.parse(inputDTO.getBirthDate());
        } catch (ParseException e1) {
            e1.printStackTrace();
        }
		tempUser.setBirthDate(inputDate);
		
		Address tempAddr = new Address();
		tempAddr.setStreet(inputDTO.getStreet());
		tempAddr.setCity(inputDTO.getCity());
		tempAddr.setState(inputDTO.getState());
		tempAddr.setZipcode(inputDTO.getZipcode());
		
		Picture pic = new Picture();
		pic = dao.findPictureById(1);
		tempUser.setPicture(pic);
		
		
		
		System.out.println(tempAddr);
		tempUser.setAddress(dao.addAddress(tempAddr));		
		mv.addObject("user", dao.addUser(tempUser));
		mv.setViewName("userDisplay");
		
		return mv;
	}
}