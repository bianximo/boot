package action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import entity.Users;
import service.UsersDao;
import service_impl.UsersDaoImpl;
public class UsersAction extends ActionSupport implements ModelDriven<Users>  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Users user = new Users();
	
	public String logout(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("loginName")!=null){
			session.removeAttribute("loginName");
		}
		return "logout_success";
	}
	
	public String login(){
		UsersDao dao = new UsersDaoImpl();
		boolean flag = dao.userLogin(user);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("loginName", user.getUsername());
		if(flag){
			session.setAttribute("loginName", user.getUsername());
			return "login_success";
		}else{
			return "login_failure";
		}
	}
	
	@Override
	public Users getModel() {
		// TODO Auto-generated method stub
		return this.user;
	}

}
