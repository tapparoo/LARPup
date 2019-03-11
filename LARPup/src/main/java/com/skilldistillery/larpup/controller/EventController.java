package com.skilldistillery.larpup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.larpup.data.EventDTO;
import com.skilldistillery.larpup.data.LarpUpDAO;
import com.skilldistillery.larpup.entities.Address;
import com.skilldistillery.larpup.entities.Event;

@RestController
@RequestMapping("event")
public class EventController {

	@Autowired
	private LarpUpDAO dao;

	@RequestMapping(path = "displayEvent.do", method = RequestMethod.GET)
	public ModelAndView eventDisplay(int eventId) {
		ModelAndView mv = new ModelAndView("eventDisplay");
		mv.addObject("event", dao.findEventById(eventId));
		return mv;
	}
	
	@RequestMapping(path = "eventForm.do", method = RequestMethod.GET)
	public ModelAndView eventForm(int eventId) {
		ModelAndView mv = new ModelAndView("eventForm");
		EventDTO dto = new EventDTO();
		mv.addObject("event", dao.findEventById(eventId));
		mv.addObject("eventDTO", dto);
		mv.addObject("action", "/event/updateEvent.do");
		return mv;
	}
	
	@RequestMapping(path = "updateEvent.do", method = RequestMethod.POST)
	public String updateEvent(EventDTO eventDTO, RedirectAttributes redir) {
		Event event = dao.findEventById(eventDTO.getId());
		
		Address address = event.getAddress();
		address.setState(eventDTO.getState());
		address.setCity(eventDTO.getCity());
		address.setZipcode(eventDTO.getZipcode());
		address.setStreet(eventDTO.getStreet());
		
//		event.setDate(eventDTO.getDate());
		event.setDescription(eventDTO.getDescription());
		event.setName(eventDTO.getName());
		event.setStory(dao.findStoryById(eventDTO.getStoryId()));
		
		if (dao.updateEvent(event)) {
			redir.addFlashAttribute("event", dao.findEventById(event.getId()));
		}
		return "redirect:displayEvent.do";
	}
	
}