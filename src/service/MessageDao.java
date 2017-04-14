package service;

import java.util.List;

import entity.Message;

public interface MessageDao {
	// 发送信息
	public boolean sendMessage(Message message);

	// 查询发送的信息
	public List<Message> querySendMessage(String sendName);

	// 查询收到的信息
	public List<Message> queryReceiveMessage(String receiveName);

	// 删除信息
	public boolean deleteMessage(int mid);
	
	// 阅读信息
	public boolean readMessage(int mid);

}
