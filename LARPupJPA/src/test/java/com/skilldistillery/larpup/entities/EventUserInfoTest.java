package com.skilldistillery.larpup.entities;

import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

@DisplayName("event user info test")
class EventUserInfoTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventUserInfo eventUserInfo;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("LARPupJPA");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		eventUserInfo = em.find(EventUserInfo.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		eventUserInfo = null;
	}

	@Test
	void test() {
		fail("Not yet implemented");
	}

}