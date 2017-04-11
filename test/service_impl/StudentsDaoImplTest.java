package service_impl;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.junit.Test;

import entity.Students;
import service.StudentsDao;

public class StudentsDaoImplTest {

	@Test
	public void testQueryStudents(){
		StudentsDao sDao = new StudentsDaoImpl();
		List<Students>list = sDao.queryStudents();
		for (Students students : list) {
			System.out.println(students);
		}
	}
	
	@Test
	public void testQueryStudentById(){
		StudentsDao sDao = new StudentsDaoImpl();
		Students students = sDao.queryStudentById("S0000001");
		System.out.println(students);
	}
//	@Test
//	public void testGetNewSid(){
//		StudentsDaoImpl sDao = new StudentsDaoImpl();
//		System.out.println(sDao.getNewSid());
//	}
	@Test 
	public void testAddStu(){
		Students student =  new Students("","ÀîÀÚ","ÄÐ",new Date(),"Î÷°²");
		StudentsDaoImpl sDao = new StudentsDaoImpl();
		System.out.println(sDao.addStudent(student));
	}
}
