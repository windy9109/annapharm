package kr.or.annapharm.dto;

import java.util.Date;

public class BoardVO {
	int boardCode;
	String memIdManager;
	String boardTitle;
	String boardContent;
	Date boardDate;
	int boardViewcount;
	String boardType;
	Date boardLastdate;

	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public String getMemIdManager() {
		return memIdManager;
	}
	public void setMemIdManager(String memIdManager) {
		this.memIdManager = memIdManager;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardViewcount() {
		return boardViewcount;
	}
	public void setBoardViewcount(int boardViewcount) {
		this.boardViewcount = boardViewcount;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public Date getBoardLastdate() {
		return boardLastdate;
	}
	public void setBoardLastdate(Date boardLastdate) {
		this.boardLastdate = boardLastdate;
	}


}
