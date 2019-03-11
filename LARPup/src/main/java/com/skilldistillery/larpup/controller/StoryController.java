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
import com.skilldistillery.larpup.entities.User;

@RestController
@RequestMapping("story")
public class StoryController {

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = { "displayStory.do" }, method = RequestMethod.GET)
	public ModelAndView displayStory(int storyId, HttpSession session) {
		Story myStory = dao.findStoryById(storyId);
		ModelAndView mv = new ModelAndView("storyDisplay");
		mv.addObject("story", myStory);
		return mv;
	}

	@RequestMapping(path = { "modifyStory.do" }, method = RequestMethod.GET)
	public ModelAndView modifyStoryGET(int storyId) {
		Story myStory = dao.findStoryById(storyId);
		
		StoryDTO dto = new StoryDTO();
				
		ModelAndView mv = new ModelAndView("storyForm");
		mv.addObject("story", myStory);
		mv.addObject("inputDTO", dto);
		mv.addObject("action", "/story/modifyStory.do");
		return mv;
	}

	@RequestMapping(path = {"modifyStory.do"}, method = RequestMethod.POST)
	public ModelAndView modifyStoryPOST(StoryDTO inputDTO) {
		ModelAndView mv = new ModelAndView();
		
		Story managedStory = dao.findStoryById(inputDTO.getStoryId());
		
		int storyIdToUpdate = managedStory.getId();
		
//		Address updateAddress = managedStory.getAddress();
		Genre updateGenre = managedStory.getGenre();
		
		managedStory.setName(inputDTO.getStoryName());
		managedStory.setDescription(inputDTO.getStoryDescription());
		managedStory.setId(inputDTO.getStoryId());
		
//		updateAddress.setCity(inputDTO.getAddressCity());
//		updateAddress.setState(inputDTO.getAddressState());
//		updateAddress.setZipcode(inputDTO.getAddressZipcode());
		
		Address address = new Address();
		address.setCity(inputDTO.getAddressCity());
		address.setState(inputDTO.getAddressState());
		address.setZipcode(inputDTO.getAddressZipcode());
		address = dao.addAddress(address);
		managedStory.setAddress(address);
		
		updateGenre.setName(inputDTO.getGenreName());
		
		if (dao.updateStory(managedStory)) {
			Story updatedStory = dao.findStoryById(storyIdToUpdate);
			
			mv.setViewName("storyDisplay");
			mv.addObject("story", updatedStory);
		} else {
			mv.setViewName("storyForm");
			mv.addObject("action", "/story/modifyStory.do");
			mv.addObject("story", dao.findStoryById(storyIdToUpdate));
		}
		return mv;
	}

	@RequestMapping(path = { "addStory.do" }, method = RequestMethod.GET)
	public ModelAndView addStoryGET() {
				
		StoryDTO dto = new StoryDTO();
		
		ModelAndView mv = new ModelAndView("storyForm");
		mv.addObject("inputDTO", dto);
		mv.addObject("action", "/story/addStory.do");
		return mv;
	}
	
	@RequestMapping(path = { "addStory.do" }, method = RequestMethod.POST)
	public ModelAndView addStoryPOST(StoryDTO inputDTO, HttpSession session) {
		
		Story newStory = new Story();
		Address newAddress = new Address();
		Genre newGenre = dao.findGenreByName(inputDTO.getGenreName());
		if (newGenre == null) {
			newGenre = new Genre();
			newGenre.setName(inputDTO.getGenreName());
			newGenre.setPicture(dao.findPictureById(4));
			newGenre = dao.addGenre(newGenre);
		}
		newAddress.setCity(inputDTO.getAddressCity());
		newAddress.setState(inputDTO.getAddressState());
		newAddress.setZipcode(inputDTO.getAddressZipcode());
		newAddress = dao.addAddress(newAddress);
		
		newStory.setGenre(newGenre);
		newStory.setAddress(newAddress);
		newStory.setName(inputDTO.getStoryName());
		newStory.setDescription(inputDTO.getStoryDescription());
		newStory.setUser((User)session.getAttribute("myUser"));
		
		Story managedStory = dao.addStory(newStory);
		
		ModelAndView mv = new ModelAndView("storyDisplay");
		mv.addObject("story", managedStory);
		return mv;
	}
	
}