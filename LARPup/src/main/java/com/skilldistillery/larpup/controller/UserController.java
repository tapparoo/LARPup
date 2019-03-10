package com.skilldistillery.larpup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.larpup.data.LarpUpDAO;
import com.skilldistillery.larpup.entities.User;

@RestController
@RequestMapping("user")
public class UserController {

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = {"displayUser.do"}, method = RequestMethod.GET)
	public ModelAndView userDisplay(int id) {
		ModelAndView mv = new ModelAndView("userDisplay");
		mv.addObject("user", dao.findUserById(id));
		return mv;
	}
	
	@RequestMapping(path = {"createUser.do"}, method = RequestMethod.POST)
	public ModelAndView addUser(User user) {
		
		ModelAndView mv = new ModelAndView();
		dao.addUser(user);
		mv.addObject("user", user);
		mv.setViewName("WEB-INF/view/userDisplay.jsp");
		
		return mv;
	}
}