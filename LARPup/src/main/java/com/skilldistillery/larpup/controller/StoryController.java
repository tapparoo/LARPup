package com.skilldistillery.larpup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.larpup.data.LarpUpDAO;
import com.skilldistillery.larpup.entities.Story;

@RestController
@RequestMapping("story")
public class StoryController {

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = {"displayStory.do"}, method = RequestMethod.GET)
	public ModelAndView userDisplay(HttpSession session) {
		Story myStory = dao.findStoryById(1);
		ModelAndView mv = new ModelAndView("storyDisplay");
		mv.addObject("story", myStory);
		return mv;
	}

}