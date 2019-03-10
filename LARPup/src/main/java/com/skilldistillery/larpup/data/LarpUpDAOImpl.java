package com.skilldistillery.larpup.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
}
