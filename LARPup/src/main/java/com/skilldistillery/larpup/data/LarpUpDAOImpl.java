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
		// TODO Auto-generated method stub
		return null;
	}

}
