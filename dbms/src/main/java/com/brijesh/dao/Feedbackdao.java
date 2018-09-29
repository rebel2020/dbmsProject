package com.brijesh.dao;
import java.util.List;

import com.brijesh.model.Feedback;
public interface Feedbackdao {
	void addFeedback(Feedback feedback);
	Feedback getFeedback(int itemId,int feedbackId);
	void deleteFeedback(int itemId,int feedbackId);
	List<Feedback> getFeedbacks(int itemId);
}
