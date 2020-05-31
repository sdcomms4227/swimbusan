package board;

import java.sql.Timestamp;

public class BoardBean {

	private int boardNum;
	private String userId;
	private String userName;
	private String boardPw;
	private String boardSubject;
	private String boardContent;
	private String boardFile;
	private int boardRe_ref;
	private int boardRe_lev;
	private int boardRe_seq;
	private int boardCount;
	private Timestamp boardDate;
	private String boardIp;
	private String boardCategory;

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBoardPw() {
		return boardPw;
	}

	public void setBoardPw(String boardPw) {
		this.boardPw = boardPw;
	}

	public String getBoardSubject() {
		return boardSubject;
	}

	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}

	public int getBoardRe_ref() {
		return boardRe_ref;
	}

	public void setBoardRe_ref(int boardRe_ref) {
		this.boardRe_ref = boardRe_ref;
	}

	public int getBoardRe_lev() {
		return boardRe_lev;
	}

	public void setBoardRe_lev(int boardRe_lev) {
		this.boardRe_lev = boardRe_lev;
	}

	public int getBoardRe_seq() {
		return boardRe_seq;
	}

	public void setBoardRe_seq(int boardRe_seq) {
		this.boardRe_seq = boardRe_seq;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public Timestamp getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Timestamp boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardIp() {
		return boardIp;
	}

	public void setBoardIp(String boardIp) {
		this.boardIp = boardIp;
	}
	
	public String getBoardCategory() {
		return boardCategory;
	}
	
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

}
