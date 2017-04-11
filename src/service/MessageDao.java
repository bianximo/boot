package service;

import java.util.List;


import entity.Message;


public interface MessageDao {
	// 发送信息
	public boolean sendMessage(Message message);
	// 查询发送的信息
	public List<Message> querySendMessage(int sendId);
	// 查询收到的信息
	public List<Message> queryReceiveMessage(int receiveId);
	//删除信息
	public boolean deleteMessage(int mid);
	// 查询收到的单条信息
	public Message querySingleMessage(int mid);
	
}
