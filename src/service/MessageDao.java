package service;

import java.util.List;

import entity.Message;

public interface MessageDao {
	// ������Ϣ
	public boolean sendMessage(Message message);

	// ��ѯ���͵���Ϣ
	public List<Message> querySendMessage(String sendName);

	// ��ѯ�յ�����Ϣ
	public List<Message> queryReceiveMessage(String receiveName);

	// ɾ����Ϣ
	public boolean deleteMessage(int mid);
	
	// �Ķ���Ϣ
	public boolean readMessage(int mid);

}
