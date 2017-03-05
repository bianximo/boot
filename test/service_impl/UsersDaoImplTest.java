package service_impl;

import org.junit.Assert;
import org.junit.Test;


import entity.Users;
import service.UsersDao;

public class UsersDaoImplTest {
	@Test
	public void UserDaoTest(){
		Users u = new Users(1,"уехЩ","123");
		UsersDao userdao = new UsersDaoImpl();
		boolean flag = userdao.userLogin(u);
		Assert.assertEquals(true, flag);
	}
}
