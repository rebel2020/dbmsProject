package com.brijesh.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.brijesh.model.OfflineRecord;

public class OfflinedaoImpl implements Offlinedao{
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	DataSource dataSource;
	
	public void newRecord(OfflineRecord offlinerecord) {
		String sql="insert into OFFLINE set itemId=?,date=?,quantity=?,amount=?";
		Object[] object= {offlinerecord.getItemId(),offlinerecord.getDate(),offlinerecord.getQuantity(),offlinerecord.getAmount()};
		jdbcTemplate.update(sql,object);
		String sql1="update ITEMS set quantity=quantity-"+offlinerecord.getQuantity()+" where itemId="+offlinerecord.getItemId();
		jdbcTemplate.update(sql1);
	}

	public OfflineRecord getRecord(int recordId) {
		String sql="select * from OFFLINE where recordId="+recordId;
		return (OfflineRecord)jdbcTemplate.query(sql, new ResultSetExtractor<OfflineRecord>()
		{
			public OfflineRecord extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					OfflineRecord record=new OfflineRecord();
					record.setAmount(rs.getInt("amount"));
					record.setDate(rs.getString("date"));
					record.setItemId(rs.getInt("itemid"));
					record.setQuantity(rs.getInt("quantity"));
					return record;
				}
				return null;
			}
		});
	}
	public List<OfflineRecord> getAllRecords() {
		String sql="select * from OFFLINE";
		List<OfflineRecord> list=jdbcTemplate.query(sql,new BeanPropertyRowMapper(OfflineRecord.class));
		return list;
	}
}
