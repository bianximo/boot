package entity;

import java.util.Date;

public class Message {
	private int mid;
	private int sendId;
	private int receiveId;
	private String message;
	private Date date;
	private int isRead;

	public Message() {
		super();
	}
	
	public int getIsRead() {
		return isRead;
	}

	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

	public Message(int mid, int sendId, int receiveId, String message, Date date, int isRead) {
		super();
		this.mid = mid;
		this.sendId = sendId;
		this.receiveId = receiveId;
		this.message = message;
		this.date = date;
		this.isRead = isRead;
	}

	
	public Message(int mid, int sendId, int receiveId, String message, Date date) {
		super();
		this.mid = mid;
		this.sendId = sendId;
		this.receiveId = receiveId;
		this.message = message;
		this.date = date;
		this.isRead = 0;
	}

	public Message(int sendId, int receiveId, String message, Date date) {
		super();
		this.sendId = sendId;
		this.receiveId = receiveId;
		this.message = message;
		this.date = date;
		this.isRead = 0;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getSendId() {
		return sendId;
	}

	public void setSendId(int sendId) {
		this.sendId = sendId;
	}

	public int getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(int receiveId) {
		this.receiveId = receiveId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getShortMessage() {
		if (message.length() <= 15)
			return message;
		else
			return message.substring(0, 15) + "...";
	}

	@Override
	public String toString() {
		return "Message [mid=" + mid + ", sendId=" + sendId + ", receiveId=" + receiveId + ", message=" + message
				+ ", date=" + date + "]";
	}

}
