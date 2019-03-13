package com.skilldistillery.larpup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.larpup.data.LarpUpDAO;

@RestController
@RequestMapping("search")
public class SearchController {

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = "searchPage.do", method = RequestMethod.GET)
	public ModelAndView searchDisplay() {
		ModelAndView mv = new ModelAndView("search");
		return mv;
	}

	@RequestMapping(path = "search.do", method = RequestMethod.GET)
	public ModelAndView userDisplay(int id, String searchFor) {
		ModelAndView mv = new ModelAndView("search");
		switch(searchFor) {
		case "roles":
			mv.addObject("searchResult", dao.findEventUsersByUserId(id));
			break;
		case "storiesOwned":
			mv.addObject("searchResult", dao.findStoriesOwnedByUserId(id));
			break;
		case "storiesParticipatedIn":
			mv.addObject("searchResult", dao.findStoriesParticipatedInByUserId(id));
			break;
		}
		return mv;
	}
}