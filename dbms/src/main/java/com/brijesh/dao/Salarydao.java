package com.brijesh.dao;

import java.util.List;

import com.brijesh.model.SalaryRecord;

public interface Salarydao {
	public void addRecord(SalaryRecord record);
	public List<SalaryRecord> getAllRecords();
	public List<SalaryRecord> getRecords(int empId);
	public Boolean isPaid(int empId,int month,int year);
}
