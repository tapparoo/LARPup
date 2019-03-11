package com.skilldistillery.larpup.data;

import com.skilldistillery.larpup.entities.Address;
import com.skilldistillery.larpup.entities.Event;
import com.skilldistillery.larpup.entities.EventComment;
import com.skilldistillery.larpup.entities.EventUser;
import com.skilldistillery.larpup.entities.EventUserInfo;
import com.skilldistillery.larpup.entities.Genre;
import com.skilldistillery.larpup.entities.Picture;
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
	StoryComment addStoryComment(StoryComment storyComment);

	EventComment findEventCommentById(int id);
	EventComment addEventComment(EventComment eventComment);

	Picture findPictureById(int id);
	Picture addPicture(Picture picture);
	boolean updatePicture(Picture picture);
	
	EventUser findEventUserById(int id);
	EventUser addEventUser(EventUser eventUser);
	boolean updateEventUser(EventUser eventUser);
	
	EventUserInfo findEventUserInfoById(int id);
	EventUserInfo addEventUserInfo(EventUserInfo eventUserInfo);
	boolean updateEventUserInfo(EventUserInfo eventUserInfo);
	
	Address findAddressById(int id);
	Address addAddress(Address address);
	boolean updateAddress(Address address);
	
	Genre findGenreById(int id);
	Genre findGenereByName(String name);
	Genre addGenre(Genre genre);
	boolean updateGenre(Genre genre);
}
