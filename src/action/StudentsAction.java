package action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import entity.Students;
import entity.Users;
import service.StudentsDao;
import service_impl.StudentsDaoImpl;

public class StudentsAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String query(){
		StudentsDao sDao = new StudentsDaoImpl();
		List<Students>list = sDao.queryStudents();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(list!=null&&list.size()>0)
		session.setAttribute("studentsList", list);
		
		return "query_success";
	}

}
