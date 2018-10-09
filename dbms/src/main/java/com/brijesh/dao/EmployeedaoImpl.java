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

import com.brijesh.dao.Employeedao;
import com.brijesh.model.Employee;

public class EmployeedaoImpl implements Employeedao{
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	DataSource datasource;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public Employee getEmployee(int empId) {
		String sql="select * from EMPLOYEES where empId="+empId;
		return jdbcTemplate.query(sql, new ResultSetExtractor<Employee>(){
			public Employee extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					Employee employee=new Employee();
					employee.setEmpId(rs.getInt("empId"));
					employee.setContactNo(rs.getString("contactNo"));
					employee.setName(rs.getString("name"));
					employee.setSalary(rs.getInt("salary"));
					employee.setWorkingArea(rs.getString("workingArea"));
					employee.setJoiningDate(rs.getString("joiningDate"));
					return employee;
				}
				return null;
			}	
		});
	}
	public int getMaxEmpId() {
		String sql="select max(empId) from EMPLOYEES";
		Employee employee=jdbcTemplate.query(sql, new ResultSetExtractor<Employee>(){
			public Employee extractData(ResultSet rs) throws SQLException
			{
				if(rs.next())
				{
					Employee employee=new Employee();
					employee.setEmpId(rs.getInt("max(empId)"));
					return employee;
				}
				return null;
			}	
		});
		if(employee!=null)
			return employee.getEmpId();
		return 0;
	}
	public List<Employee> getAllEmployee() {
		String sql="select * from EMPLOYEES";
		List<Employee> list;
		list=(List<Employee>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Employee>(Employee.class));
		return list;
	}

	public void addEmployee(Employee employee) {
		int empId=getMaxEmpId()+1;
		String sql="insert into EMPLOYEES set empId=?name=?,workingArea=?,salary=?,contactNo=?,joiningDate=?";
		Object[] object= {empId,employee.getName(),employee.getWorkingArea(),employee.getSalary(),employee.getContactNo(),employee.getJoiningDate()};
		jdbcTemplate.update(sql,object);
		
	}
	
}
