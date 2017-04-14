package entity;

import java.util.Date;

public class Message {
	private int mid;
	private String sendName;
	private String receiveName;
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

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getSendName() {
		return sendName;
	}

	public void setSendName(String sendName) {
		this.sendName = sendName;
	}

	public String getReceiveName() {
		return receiveName;
	}

	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
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

	public Message(int mid, String sendName, String receiveName, String message, Date date, int isRead) {
		super();
		this.mid = mid;
		this.sendName = sendName;
		this.receiveName = receiveName;
		this.message = message;
		this.date = date;
		this.isRead = isRead;
	}

	public Message(int mid, String sendName, String receiveName, String message, Date date) {
		super();
		this.mid = mid;
		this.sendName = sendName;
		this.receiveName = receiveName;
		this.message = message;
		this.date = date;
	}

	public Message(String sendName, String receiveName, String message, Date date) {
		super();
		this.sendName = sendName;
		this.receiveName = receiveName;
		this.message = message;
		this.date = date;
	}

	public String getShortMessage() {
		if (this.message.length() <= 15) {
			return message;
		} else {
			return message.substring(0, 15) + "...";
		}
	}

}
