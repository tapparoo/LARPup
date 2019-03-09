package com.skilldistillery.larpup.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

@DisplayName("event Comment tests")
class EventCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventComment eventComment;

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
		eventComment = em.find(EventComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		eventComment = null;
	}

	@Test
	void test_eventcomment_mappings() {
		assertEquals(expected, eventComment.getComment());
	}
	
	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}

}
//	private String comment;
//	
//	@Column(name="post_time")
//	@CreationTimestamp
//	private LocalDateTime postTime;
//	
//	@ManyToOne
//	@JoinColumn(name="user_id")
//	private User user;
//	
//	@ManyToOne
//	@JoinColumn(name="event_id")
//	private Event event;