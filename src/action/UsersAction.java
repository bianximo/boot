package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import entity.Message;
import entity.Users;
import service.MessageDao;
import service.UsersDao;
import service_impl.MessageDaoImpl;
import service_impl.StudentsDaoImpl;
import service_impl.UsersDaoImpl;

public class UsersAction extends ActionSupport implements ModelDriven<Users> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Users user = new Users();

	private String newpassword = null;

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpasswordString) {
		this.newpassword = newpasswordString;
	}

	public String logout() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (session.getAttribute("loginName") != null) {
			session.removeAttribute("loginName");
		}
		return "logout_success";
	}

	public String regist() {
		UsersDao dao = new UsersDaoImpl();
		boolean flag = dao.userRegist(user);
		HttpSession session = ServletActionContext.getRequest().getSession();
		ServletContext application = ServletActionContext.getServletContext();

		if (application.getAttribute("stuNum") == null) {
			StudentsDaoImpl studentsDaoImpl = new StudentsDaoImpl();
			int num = studentsDaoImpl.queryStudents().size();
			application.setAttribute("stuNum", num);
		}

		if (flag) {
			session.setAttribute("loginName", user.getUsername());
			MessageDao messageDao = new MessageDaoImpl();
			int uid = dao.getIdByUsername(user.getUsername());

			List<Message> list = new ArrayList<Message>();
			List<Message> receList = messageDao.queryReceiveMessage(uid);
			for (Message message : receList) {
				list.add(message);
			}
			session.setAttribute("newMessage", list);
			session.setAttribute("noreadMessage", list.size());
			return "login_success";
		} else {
			return "login_failure";
		}
	}

	public String update() {
		UsersDao dao = new UsersDaoImpl();
		boolean flag = dao.userUpdate(user, newpassword);
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (flag) {
			session.setAttribute("updateIsLegal", true);
		} else {
			session.setAttribute("updateIsLegal", false);
		}
		return "update_success";
	}

	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		ServletContext application = ServletActionContext.getServletContext();

		if (application.getAttribute("stuNum") == null) {
			StudentsDaoImpl studentsDaoImpl = new StudentsDaoImpl();
			int num = studentsDaoImpl.queryStudents().size();
			application.setAttribute("stuNum", num);
		}

		String remember = request.getParameterValues("remember")[0];
		if (remember != null && remember.length() > 0) {
			Cookie usernameCookie = new Cookie("username", user.getUsername());
			Cookie userpasswordCookie = new Cookie("password", user.getUsername());
			Cookie ischeckedCookie = new Cookie("check", "true");
			usernameCookie.setMaxAge(60 * 60 * 24 * 7);
			userpasswordCookie.setMaxAge(60 * 60 * 24 * 7);
			ischeckedCookie.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(ischeckedCookie);
			response.addCookie(userpasswordCookie);
			response.addCookie(usernameCookie);
		}
		UsersDao dao = new UsersDaoImpl();

		boolean flag = dao.userLogin(user);
		if (flag) {
			session.setAttribute("loginName", user.getUsername());
			MessageDao messageDao = new MessageDaoImpl();
			int uid = dao.getIdByUsername(user.getUsername());

			List<Message> list = new ArrayList<Message>();
			List<Message> receList = messageDao.queryReceiveMessage(uid);
			for (Message message : receList) {
				list.add(message);
			}
			session.setAttribute("newMessage", list);
			session.setAttribute("noreadMessage", list.size());
			return "login_success";
		} else {
			return "login_failure";
		}
	}

	@Override
	public Users getModel() {
		// TODO Auto-generated method stub
		return this.user;
	}

}
