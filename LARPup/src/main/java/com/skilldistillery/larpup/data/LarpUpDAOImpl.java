package com.skilldistillery.larpup.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.larpup.entities.Story;
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
}






