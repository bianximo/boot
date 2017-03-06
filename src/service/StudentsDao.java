package service;

import java.util.List;

import entity.Students;

public interface StudentsDao {
	//获取所有学生的信息
	public List<Students> queryStudents();
	//根据id获取单个学生的信息
	public Students queryStudentById(String id);
	//修改学生信息
	public boolean updateStudent(Students s);
	//增加学生
	public boolean addStudent(Students s);
	//删除学生
	public boolean removeStudent(String id);
}
