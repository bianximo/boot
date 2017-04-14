package service_impl;

import java.util.Date;
import java.util.List;

import org.junit.Test;

import entity.Message;
import service.MessageDao;

public class MessageDaoImplTest {

	@Test
	public void testSendMessage() {
		Message message = new Message();
		message.setReceiveName("张三");
		message.setSendName("shermo");
		message.setDate(new Date());
		message.setMessage("test");
		MessageDao messageDaoTest = new MessageDaoImpl();
		messageDaoTest.sendMessage(message);
	}

	@Test
	public void testQuerReceiveMessage() {
		MessageDao messageDao = new MessageDaoImpl();
		List<Message> list = messageDao.queryReceiveMessage("张三");
		for (Message message : list) {
			System.out.println(message);
		}
	}

	@Test
	public void testQuerSendMessage() {
		MessageDao messageDao = new MessageDaoImpl();
		List<Message> list = messageDao.querySendMessage("shermo");
		for (Message message : list) {
			System.out.println(message);
		}
	}

	@Test
	public void testDeleteMessage() {
		MessageDao messageDao = new MessageDaoImpl();
		System.out.println(messageDao.deleteMessage(4));
	}
}
