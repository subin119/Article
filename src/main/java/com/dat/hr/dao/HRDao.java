package com.dat.hr.dao;

import java.util.List;

import com.dat.hr.vo.DepartmentsVO;
import com.dat.hr.vo.EmployeesVO;

public interface HRDao {

	public List<EmployeesVO> getEmployees();
	
	public List<DepartmentsVO> getDepartments();
	
	
	
}
