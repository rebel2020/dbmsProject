package com.brijesh.model;

import java.sql.Date;

public class Feedback {
	int feedbackId;
	int itemId;
	String userId;
	String content;
	Date date;
	public int getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(int feedbackNo) {
		this.feedbackId = feedbackNo;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
