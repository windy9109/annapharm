package kr.or.annapharm.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author PC-09
 * 	개요 : 자주묻는 질문의 데이터를 받는 VO
 * 	작성자 : 이병진
 */
@SuppressWarnings("serial")
public class QnaVO implements Serializable{

	private String qnaCode;				// Qna코드
	private String memIdManager;		// 아이디
	private String qnaTitle;       	    // Qna제목
	private String qnaContent;     	    // 질문내용
	private String qnaReply;       	    // 답변
	private Date qnaDate;        	    // 최초작성일
	private Date qnaLastdate;    	    // 최종수정일


	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public Date getQnaLastdate() {
		return qnaLastdate;
	}
	public void setQnaLastdate(Date qnaLastdate) {
		this.qnaLastdate = qnaLastdate;
	}
	public String getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(String qnaCode) {
		this.qnaCode = qnaCode;
	}
	public String getMemIdManager() {
		return memIdManager;
	}
	public void setMemIdManager(String memIdManager) {
		this.memIdManager = memIdManager;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaReply() {
		return qnaReply;
	}
	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SIMPLE_STYLE);
	}


}
