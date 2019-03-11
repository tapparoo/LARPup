package com.skilldistillery.larpup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.larpup.data.LarpUpDAO;
import com.skilldistillery.larpup.data.StoryDTO;
import com.skilldistillery.larpup.entities.Address;
import com.skilldistillery.larpup.entities.Genre;
import com.skilldistillery.larpup.entities.Story;

@RestController
@RequestMapping("story")
public class StoryController {

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = {"displayStory.do"}, method = RequestMethod.GET)
	public ModelAndView displayStory(int storyId, HttpSession session) {
		Story myStory = dao.findStoryById(storyId);
		ModelAndView mv = new ModelAndView("storyDisplay");
		mv.addObject("story", myStory);
		return mv;
	}
	
	@RequestMapping(path = {"modifyStory.do"}, method = RequestMethod.GET)
	public ModelAndView modifyStory(int storyId) {
		Story myStory = dao.findStoryById(storyId);
		StoryDTO dto = new StoryDTO();
		ModelAndView mv = new ModelAndView("storyForm");
		mv.addObject("story", myStory);
		mv.addObject("inputDTO", dto);
		mv.addObject("action", "/story/modifyStory.do");
		return mv;
	}
	
	@RequestMapping(path = {"modifyStory.do"}, method = RequestMethod.POST)
	public ModelAndView modifyStory(StoryDTO inputDTO) {
		ModelAndView mv = new ModelAndView();
		
		Story managedStory = dao.findStoryById(inputDTO.getStoryId());
		
		int storyIdToUpdate = managedStory.getId();
		
		Address updateAddress = managedStory.getAddress();
		Genre updateGenre = managedStory.getGenre();
		
		managedStory.setName(inputDTO.getStoryName());
		managedStory.setDescription(inputDTO.getStoryDescription());
		managedStory.setId(inputDTO.getStoryId());
		
		updateAddress.setCity(inputDTO.getAddressCity());
		updateAddress.setState(inputDTO.getAddressState());
		updateAddress.setZipcode(inputDTO.getAddressZipcode());
		
		updateGenre.setName(inputDTO.getGenreName());
		
		if (dao.updateStory(managedStory)) {
			Story updatedStory = dao.findStoryById(managedStory.getId());
			
			mv.setViewName("storyDisplay");
			mv.addObject("story", updatedStory);
		} else {
			mv.setViewName("storyForm");
			mv.addObject("action", "/story/modifyStory.do");
			mv.addObject("story", dao.findStoryById(managedStory.getId()));
		}
		return mv;
	}

}