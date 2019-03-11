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
		ModelAndView mv = new ModelAndView("index");
		User myUser = dao.findUserByEmail(email);
		
		if (email.contentEquals(myUser.getEmail()) && password.equals(myUser.getPassword())) {
			session.setAttribute("myUser", myUser);
		} 
		
		return mv;
	}
	
	@RequestMapping(path = {"logout.do"}, method = RequestMethod.GET)
	public ModelAndView userDisplay(HttpSession session) {
		ModelAndView mv = new ModelAndView("index");
		User myUser = null;
		session.setAttribute("myUser", myUser);
		return mv;
	}

}