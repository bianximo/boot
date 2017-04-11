package entity;

import java.util.Date;

public class Students {
	private String sid;
	private String sname;
	private String gender;
	private Date date;
	private String address;
	public Students(String sid, String sname, String gender, Date date, String address) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.gender = gender;
		this.date = date;
		this.address = address;
	}
	public Students() {
		super();
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", sname=" + sname + ", gender=" + gender + ", birthday=" + date
				+ ", address=" + address + "]";
	}
	
	
	
}
