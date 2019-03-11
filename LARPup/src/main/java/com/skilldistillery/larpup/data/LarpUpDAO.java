package com.skilldistillery.larpup.data;

import com.skilldistillery.larpup.entities.Event;
import com.skilldistillery.larpup.entities.Picture;
import com.skilldistillery.larpup.entities.EventComment;
import com.skilldistillery.larpup.entities.Story;
import com.skilldistillery.larpup.entities.StoryComment;
import com.skilldistillery.larpup.entities.User;

public interface LarpUpDAO {
	
	User findUserById (int id);
	User findUserByEmail (String email);
	User addUser(User user);
	boolean updateUser(User user);
	
	Story findStoryById(int id);
	Story addStory(Story story);
	boolean updateStory(Story story);
	
	Event findEventById(int id);
	Event addEvent(Event event);
	boolean updateEvent(Event event);
	
	StoryComment findStoryCommentById(int id);
	EventComment findEventCommentById(int id);
	StoryComment addStoryComment(StoryComment storyComment);
	EventComment addEventComment(EventComment eventComment);

	Picture findPictureById(int id);
	Picture addPicture(Picture picture);
	boolean updatePicture(Picture picture);
}
