package com.skilldistillery.larpup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.larpup.data.EventDTO;
import com.skilldistillery.larpup.data.LarpUpDAO;
import com.skilldistillery.larpup.entities.Address;
import com.skilldistillery.larpup.entities.Event;
import com.skilldistillery.larpup.entities.Story;

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
	public ModelAndView updateEventForm(int eventId) {
		ModelAndView mv = new ModelAndView("eventForm");
		EventDTO dto = new EventDTO();
		mv.addObject("event", dao.findEventById(eventId));
		mv.addObject("eventDTO", dto);
		mv.addObject("action", "/event/updateEvent.do");
		return mv;
	}
	
	@RequestMapping(path = "updateEvent.do", method = RequestMethod.POST)
	public ModelAndView updateEvent(EventDTO eventDTO) {
		ModelAndView mv = new ModelAndView("eventDisplay");
		Event event = dao.findEventById(eventDTO.getId());
		
		Address address = new Address();
		address.setState(eventDTO.getState());
		address.setCity(eventDTO.getCity());
		address.setZipcode(eventDTO.getZipcode());
		address.setStreet(eventDTO.getStreet());
		event.setAddress(dao.addAddress(address));
		event.setDescription(eventDTO.getDescription());
		event.setName(eventDTO.getName());
		event.setStory(dao.findStoryById(eventDTO.getStoryId()));
//		DATE IS BROKEN		
//		event.setDate(eventDTO.getDate());
		
		if (dao.updateEvent(event)) {
			mv.addObject("event", dao.findEventById(event.getId()));
		}
		return mv;
	}
	
	@RequestMapping(path = "newEventForm.do")
	public ModelAndView addEventForm(int storyId) {
		ModelAndView mv = new ModelAndView("eventForm");
		EventDTO dto = new EventDTO();
		dto.setStoryId(storyId);
		mv.addObject("event", new Event());
		mv.addObject("eventDTO", dto);
		mv.addObject("action", "/event/addEvent.do");
		return mv;
	}

	@RequestMapping(path = "addEvent.do", method = RequestMethod.POST)
	public ModelAndView addEvent(EventDTO eventDTO) {
		ModelAndView mv = new ModelAndView("eventDisplay");
		Event event = dao.findEventById(eventDTO.getId());
		
		if( event == null) {
			event = new Event();
		}
		
		Address address = new Address();
		address.setState(eventDTO.getState());
		address.setCity(eventDTO.getCity());
		address.setZipcode(eventDTO.getZipcode());
		address.setStreet(eventDTO.getStreet());
		event.setAddress(dao.addAddress(address));
		event.setDescription(eventDTO.getDescription());
		event.setName(eventDTO.getName());
		event.setStory(dao.findStoryById(eventDTO.getStoryId()));
		event.setDate(eventDTO.getDate());
		
		mv.addObject("event", dao.addEvent(event));
		return mv;
	}
	
}