package com.skilldistillery.larpup.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.larpup.entities.Event;
import com.skilldistillery.larpup.entities.EventComment;
import com.skilldistillery.larpup.entities.Story;
import com.skilldistillery.larpup.entities.StoryComment;
import com.skilldistillery.larpup.entities.User;

@Transactional
@Service
public class LarpUpDAOImpl implements LarpUpDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	public User findUserById (int id) {
		return em.find(User.class, id);
	}

	@Override
	public User findUserByEmail(String email) {
		String query = "SELECT u FROM User u WHERE u.email = :email";
		return em.createQuery(query, User.class).setParameter("email", email).getSingleResult();
	}
	
	@Override
	public User addUser(User user) {
		em.persist(user);
		em.flush();
		return user;
	}
	
	@Override
	public boolean updateUser(User user) {
		User managed = em.find(User.class, user.getId());

		if (managed == null) {
			return false;
		}

		try {
			managed.setBirthDate(user.getBirthDate());
			managed.setPicture(user.getPicture());
			managed.setAddress(user.getAddress());
			managed.setCreateDate(user.getCreateDate());
			managed.setEmail(user.getEmail());
			managed.setEventRoles(user.getEventRoles());
			managed.setFirstName(user.getFirstName());
			managed.setLastName(user.getLastName());
			managed.setNickname(user.getNickname());
			managed.setPassword(user.getPassword());
			managed.setActive(user.isActive());

			em.persist(managed);
			em.flush();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public Story findStoryById(int id) {
		return em.find(Story.class, id);
	}
	
	@Override
	public Story addStory(Story story) {
		em.persist(story);
		em.flush();
		return story;
	}
	
	@Override
	public boolean updateStory(Story story) {
		Story managed = em.find(Story.class, story.getId());
		
		if (managed == null)
			return false;
		
		try {
			managed.setAddress(story.getAddress());
			managed.setCreateDate(story.getCreateDate());
			managed.setDescription(story.getDescription());
			managed.setEventRoles(story.getEventRoles());
			managed.setEvents(story.getEvents());
			managed.setGenre(story.getGenre());
			managed.setName(story.getName());
			managed.setUser(story.getUser());
			
			em.persist(managed);
			em.flush();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	@Override
	public Event findEventById(int id) {
		return em.find(Event.class, id);
	}
	
	@Override
	public Event addEvent(Event event) {
		em.persist(event);
		em.flush();
		return event;
	}
	
	@Override
	public boolean updateEvent(Event event) {
		Event managed = em.find(Event.class, event.getId());
		
		if (managed == null)
			return false;
		
		try {
			managed.setAddress(event.getAddress());
			managed.setCreateDate(event.getCreateDate());
			managed.setDate(event.getDate());
			managed.setDescription(event.getDescription());
			managed.setEventUsers(event.getEventUsers());
			managed.setName(event.getName());
			managed.setStory(event.getStory());
			
			em.persist(managed);
			em.flush();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	@Override
	public StoryComment findStoryCommentById(int id) {
		return em.find(StoryComment.class, id);
	}
	
	@Override
	public EventComment findEventCommentById(int id) {
		return em.find(EventComment.class, id);
	}
	
	@Override
	public StoryComment addStoryComment(StoryComment storyComment) {
		em.persist(storyComment);
		em.flush();
		return storyComment;
	}
	
	@Override
	public EventComment addEventComment(EventComment eventComment) {
		em.persist(eventComment);
		em.flush();
		return eventComment;
	}
}






