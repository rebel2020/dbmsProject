package com.brijesh.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.brijesh.model.SalaryRecord;

public class SalarydaoImpl implements Salarydao{
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	DataSource datasource;
	public void addRecord(SalaryRecord record) {
		String sql="insert into SALARYRECORD set empId=?,month=?,year=?,salary=?,paid=?";
		Object[] object= {record.getEmpId(),record.getMonth(),record.getYear(),record.getSalary(),record.getPaid()};
		jdbcTemplate.update(sql,object);
	}

	public List<SalaryRecord> getAllRecords() {
		String sql="select * from SALARYRECORD";
		List<SalaryRecord> list=jdbcTemplate.query(sql, new BeanPropertyRowMapper(SalaryRecord.class));
		return list;
	}
	public List<SalaryRecord> getRecords(int empId) {
		String sql="select * from SALARYRECORD where empId="+empId;
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper(SalaryRecord.class));
	}

	public Boolean isPaid(int empId, int month, int year) {
		String sql="select * from SALARYRECORD where empId="+empId+" and month="+month+" and year="+year;
		return jdbcTemplate.query(sql, new ResultSetExtractor<SalaryRecord>() {
		public SalaryRecord extractData(ResultSet rs) throws SQLException
		{
			if(rs.next())
			{
				SalaryRecord record=new SalaryRecord();
				return record;
			}
			return null;
		}
		})!=null;
	}
}
