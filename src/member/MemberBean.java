package member;

import java.sql.Timestamp;

public class MemberBean {
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private int userZipcode;
	private String userAddress1;
	private String userAddress2;
	private String userPhone;
	private Timestamp userRegdate;
	
	public MemberBean() {}	
	
	public MemberBean(String userId, String userPw, String userName, String userEmail, int userZipcode, String userAddress1, String userAddress2, String userPhone, Timestamp userRegdate) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userZipcode = userZipcode;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.userPhone = userPhone;
		this.userRegdate = userRegdate;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(int userZipcode) {
		this.userZipcode = userZipcode;
	}
	public String getUserAddress1() {
		return userAddress1;
	}
	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}
	public String getUserAddress2() {
		return userAddress2;
	}
	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public Timestamp getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(Timestamp userRegdate) {
		this.userRegdate = userRegdate;
	}


}
