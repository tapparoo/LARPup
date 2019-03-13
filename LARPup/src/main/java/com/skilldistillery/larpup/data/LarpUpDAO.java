package com.skilldistillery.larpup.data;

import java.util.List;

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
	List<User> findAllUsers();
	List<User> findFilteredUsers(String filterColumn, String filterBy);
	User addUser(User user);
	boolean updateUser(User user);
	
	Story findStoryById(int id);
	List<Story> getRecentStories(int count);
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
	Picture findPictureByUrl(String url);
	Picture addPicture(Picture picture);
	boolean updatePicture(Picture picture);
	
	EventUser findEventUserById(int id);
	EventUser addEventUser(EventUser eventUser);
	void removeEventUser(EventUser eventUser);
	boolean updateEventUser(EventUser eventUser);
	
	EventUserInfo findEventUserInfoById(int id);
	EventUserInfo addEventUserInfo(EventUserInfo eventUserInfo);
	boolean updateEventUserInfo(EventUserInfo eventUserInfo);
	
	Address findAddressById(int id);
	Address addAddress(Address address);
	boolean updateAddress(Address address);
	
	Genre findGenreById(int id);
	Genre findGenreByName(String name);
	Genre addGenre(Genre genre);
	boolean updateGenre(Genre genre);
}
