package com.skilldistillery.larpup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.larpup.data.LarpUpDAO;
import com.skilldistillery.larpup.entities.User;

@RestController
@RequestMapping("auth")
public class AuthorizationController {

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = {"authorize.do"}, method = RequestMethod.GET)
	public ModelAndView userDisplay() {
		ModelAndView mv = new ModelAndView("authorization");
		return mv;
	}
	
	@RequestMapping(path = {"authorize.do"}, params= {"email", "password"}, method = RequestMethod.GET)
	public ModelAndView checkUser(String email, String password, HttpSession session) {
		User myUser = new User();
		myUser.setEmail("Flubber@gmail.com");
		myUser.setPassword("blubber");
		
		if (email.contentEquals(myUser.getEmail()) && password.equals(myUser.getPassword())) {
			System.out.println("THEY MATCH");
			session.setAttribute("myUser", myUser);
		} else {
			System.out.println("THEY DO NOT MATCH");
		}
		
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	

}