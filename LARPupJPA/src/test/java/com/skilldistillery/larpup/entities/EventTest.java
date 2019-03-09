package com.skilldistillery.larpup.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

@DisplayName("event tests")
class EventTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

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
		event = em.find(Event.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		event = null;
	}
	@Test
	void test_name_for_event_test_mapping() {
		assertEquals("Train Heist", event.getName());
		
	}
	
	@Test
	void test_event_test_id6_is_null() {
		event = em.find(Event.class, 5);
		assertEquals("Marriage of Two Races", event.getName());
		assertEquals("Thrall and Aggra finally get together to have a marriage to bring two kingdoms together.",event.getDescription());
		assertEquals("2018-07-15T23:57:41", event.getDate().toString());
		assertEquals(2,event.getStory().getId());
		assertEquals(5, event.getAddress().getId());
	}
//	'4','18300 W Alameda Pkwy','Lakewood','Colorado','80465','7208652492'

	@Test
	void test_manytoone_association_between_event_and_address() {
		assertEquals("18300 W Alameda Pkwy", event.getAddress().getStreet());
		
	}

	@Test
	void test() {
		fail("Not yet implemented");
	}

}
