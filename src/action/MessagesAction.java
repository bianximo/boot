package action;

import java.util.Date;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import entity.Message;
import service.MessageDao;
import service.UsersDao;
import service_impl.MessageDaoImpl;
import service_impl.UsersDaoImpl;

public class MessagesAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Message message = null;
	private int messageId = 0;
	private String data = null;
	private int sendId = 0;
	private int receiveId = 0;
	private Date date = null;

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	// 发送信息方法
	public String send() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String sendName = (String) session.getAttribute("loginName");
		String receiveName = request.getParameter("receiveName");
		UsersDao userdao = new UsersDaoImpl();
		sendId = userdao.getIdByUsername(sendName);
		receiveId = userdao.getIdByUsername(receiveName);
		date = new Date();
		message = new Message(sendId, receiveId, data, date);
		
		MessageDao messageDao = new MessageDaoImpl();
		boolean flag = messageDao.sendMessage(message);
		if(flag)return "send_message_success";
		else return "send_message_failure";
	}
	//删除信息
	public String delete(){
		MessageDao messageDao = new MessageDaoImpl();
		messageDao.deleteMessage(messageId);
		return "delete_message_success";
	}
	
	//查询信息
	public String query() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		String userName = (String) session.getAttribute("loginName");
		UsersDao userdao = new UsersDaoImpl();
		int userid = userdao.getIdByUsername(userName);
		
		MessageDao messageDao = new MessageDaoImpl();
		List<Message>receiveList = messageDao.queryReceiveMessage(userid);
		List<Message>sendList = messageDao.querySendMessage(userid);
		
		session.setAttribute("receiveList", receiveList);
		session.setAttribute("sendList", sendList);
		
		return "query_message_success";
	}
	
	//查询所有信息
		public String queryAll() {
			HttpSession session = ServletActionContext.getRequest().getSession();
			
			String userName = (String) session.getAttribute("loginName");
			UsersDao userdao = new UsersDaoImpl();
			int userid = userdao.getIdByUsername(userName);
			
			MessageDao messageDao = new MessageDaoImpl();
			List<Message>receiveList = messageDao.queryReceiveMessage(userid);
			List<Message>sendList = messageDao.querySendMessage(userid);
			
			session.setAttribute("receiveList", receiveList);
			session.setAttribute("sendList", sendList);
			
			return "query_message_success";
		}
}
