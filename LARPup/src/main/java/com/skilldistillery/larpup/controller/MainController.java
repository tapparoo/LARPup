package com.skilldistillery.larpup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.larpup.data.LarpUpDAO;

@RestController
@RequestMapping({"/", "home"})
public class MainController {

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = {"/" , "home.do"}, method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}

}
