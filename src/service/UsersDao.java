package service;

import entity.Users;

public interface UsersDao {
	// 用户登录方法
	public boolean userLogin(Users user);

	// 注册方法
	public boolean userRegist(Users user);

	// 修改密码
	public boolean userUpdate(Users user, String newpassword);

	//通过姓名查找id
	public int getIdByUsername(String username);

	
}
