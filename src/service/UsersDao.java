package service;

import entity.Users;

public interface UsersDao {
	// �û���¼����
	public boolean userLogin(Users user);

	// ע�᷽��
	public boolean userRegist(Users user);

	// �޸�����
	public boolean userUpdate(Users user, String newpassword);

	//ͨ����������id
	public int getIdByUsername(String username);

	
}
