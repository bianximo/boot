package service;

import java.util.List;

import entity.Students;

public interface StudentsDao {
	//��ȡ����ѧ������Ϣ
	public List<Students> queryStudents();
	//����id��ȡ����ѧ������Ϣ
	public Students queryStudentById(String id);
	//�޸�ѧ����Ϣ
	public boolean updateStudent(Students s);
	//����ѧ��
	public boolean addStudent(Students s);
	//ɾ��ѧ��
	public boolean removeStudent(String id);
}
