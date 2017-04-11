package service;

import java.util.List;


import entity.Message;


public interface MessageDao {
	// ������Ϣ
	public boolean sendMessage(Message message);
	// ��ѯ���͵���Ϣ
	public List<Message> querySendMessage(int sendId);
	// ��ѯ�յ�����Ϣ
	public List<Message> queryReceiveMessage(int receiveId);
	//ɾ����Ϣ
	public boolean deleteMessage(int mid);
	// ��ѯ�յ��ĵ�����Ϣ
	public Message querySingleMessage(int mid);
	
}
