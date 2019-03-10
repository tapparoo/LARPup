package com.skilldistillery.larpup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.larpup.data.LarpUpDAO;

@RestController
@RequestMapping("user")
public class UserController {

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = {"displayUser.do"}, method = RequestMethod.GET)
	public ModelAndView userDisplay() {
		
		ModelAndView mv = new ModelAndView("userDisplay");
		return mv;
	}

}