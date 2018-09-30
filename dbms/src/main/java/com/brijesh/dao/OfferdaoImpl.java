package com.brijesh.dao;

import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.brijesh.dao.Offerdao;
import com.brijesh.model.Offer;
public class OfferdaoImpl implements Offerdao{

	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	DataSource datasource;
	
	public Boolean isEnabled(int offerId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Offer getOffer(int offerId) {
		String sql="select * from OFFER where offerId="+offerId;
		List<Offer> list=jdbcTemplate.query(sql, new BeanPropertyRowMapper(Offer.class));
		Iterator itr=list.iterator();
		return (Offer)itr.next();
	}

	public void addOffer(Offer offer) {
		String sql="insert into OFFER set enabled=1,percentageOff=?";
		Object[] object= {offer.getPercentageOff()};
		jdbcTemplate.update(sql,object);
	}
	public void deleteOffer(int offerId) {
		String sql="update OFFER set enabled=0 where offerId="+offerId;
		jdbcTemplate.update(sql);
	}

}
