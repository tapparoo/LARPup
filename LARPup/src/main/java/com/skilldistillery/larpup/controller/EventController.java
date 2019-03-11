package com.skilldistillery.larpup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.larpup.data.LarpUpDAO;

@RestController
@RequestMapping("event")
public class EventController {

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = {"displayEvent.do"}, method = RequestMethod.GET)
	public ModelAndView userDisplay(int eventId) {
		ModelAndView mv = new ModelAndView("eventDisplay");
		mv.addObject("event", dao.findEventById(eventId));
		return mv;
	}
}