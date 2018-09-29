package com.brijesh.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.sql.DataSourceDefinition;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.brijesh.model.Feedback;
public class FeedbackdaoImpl implements Feedbackdao{
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	public void addFeedback(Feedback feedback) {
		String sql="insert into FEEDBACK set itemId=?,userId=?,content=?,date=?";
		Object[] object= {feedback.getItemId(),feedback.getUserId(),feedback.getContent(),feedback.getDate()};
		jdbcTemplate.update(sql,object);
	}

	public List<Feedback> getFeedbacks(int itemId) {
		String sql="select * from FEEDBACK where itemId="+itemId;
		@SuppressWarnings("unchecked")
		List<Feedback> list=(List<Feedback>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(Feedback.class));
		return list;
	}

	public void deleteFeedback(int itemId, int feedbackId) {
		String sql="delete from FEEDBACK where itemId=? and feedbackId=?";
		Object[] object= {itemId,feedbackId};
		jdbcTemplate.update(sql,object);
	}

	public Feedback getFeedback(int itemId, int feedbackId) {
		String sql="select * from FEEDBACK where itemId="+itemId+" and feedbackId="+feedbackId;
		Object[] object= {itemId,feedbackId};
		return jdbcTemplate.query(sql,new ResultSetExtractor<Feedback>() {
		public Feedback extractData(ResultSet rs) throws SQLException
		{
			if(rs.next())
			{
				Feedback feedback=new Feedback();
				feedback.setContent(rs.getString("content"));
				feedback.setUserId(rs.getString("userId"));
				feedback.setItemId(rs.getInt("itemId"));
//				feedback.setDate(rs.getDate("date"));
				return feedback;
			}
			
			return null;
		}
		});
	}

}
