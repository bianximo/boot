package action;

import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

import entity.Students;
import service.StudentsDao;
import service_impl.StudentsDaoImpl;

public class StudentsAction extends ActionSupport {

	/**
	 * stduentsµÄaction
	 */
	private static final long serialVersionUID = 2L;
	private Students stu = new Students();
	private String sid = null;
	private String sname = null;
	private String gender = null;
	private String address = null;
	private String date = null;

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Students getStu() {
		return stu;
	}

	public void setStu(Students stu) {
		this.stu = stu;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String query() {
		StudentsDao sDao = new StudentsDaoImpl();
		List<Students> list = sDao.queryStudents();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (list != null && list.size() > 0)
			session.setAttribute("studentsList", list);
		ServletContext  application = ServletActionContext.getServletContext();
		application.setAttribute("stuNum", list.size());
		return "query_success";
	}

	public String add() {
		StudentsDao studentsDao = new StudentsDaoImpl();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (sname == null || sname.trim().equals("") || date == null || date.trim().equals("") || address == null
				|| address.trim().equals("")) {
			session.setAttribute("submitIsLegal", false);
			return "add_success";
		}
		stu.setSname(sname);
		stu.setGender(gender);
		stu.setAddress(address);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date day = null;
		try {
			day = dateFormat.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		stu.setDate(day);
		boolean flag = studentsDao.addStudent(stu);
		if (flag) {
			ServletContext  application = ServletActionContext.getServletContext();
			application.setAttribute("stuNum", (Integer)application.getAttribute("stuNum")+1);
			session.setAttribute("submitIsLegal", true);
		} else {
			session.setAttribute("submitIsLegal", false);
		}
		return "add_success";
	}

	public String delete() {
		StudentsDao sDao = new StudentsDaoImpl();
		sDao.removeStudent(sid);
		ServletContext  application = ServletActionContext.getServletContext();
		application.setAttribute("stuNum", (Integer)application.getAttribute("stuNum")-1);
		return "delete_success";
	}

	public String update() {
		StudentsDao studentsDao = new StudentsDaoImpl();
		stu.setSid(sid);
		stu.setSname(sname);
		stu.setGender(gender);
		stu.setAddress(address);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date day = null;
		try {
			day = dateFormat.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		stu.setDate(day);
		studentsDao.updateStudent(stu);
		return "update_success";
	}

}
