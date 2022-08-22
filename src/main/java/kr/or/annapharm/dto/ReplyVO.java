package kr.or.annapharm.dto;

import java.util.Date;

public class ReplyVO extends MemberVO {

	private int chemistInCode;
	private String chemistCode;
	private String chemistInReply;
	private String chemistInAdopt;
	private int chemistAnsCode;
	private String ansDate;
	private int chemistAnsLike;
	private String memId;
	private String likeCheck;

	private String pharmacyCode;
	private String pharmacyName;







	public String getPharmacyCode() {
		return pharmacyCode;
	}

	public void setPharmacyCode(String pharmacyCode) {
		this.pharmacyCode = pharmacyCode;
	}

	public String getPharmacyName() {
		return pharmacyName;
	}

	public void setPharmacyName(String pharmacyName) {
		this.pharmacyName = pharmacyName;
	}

	public String getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(String likeCheck) {
		this.likeCheck = likeCheck;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getChemistAnsLike() {
		return chemistAnsLike;
	}

	public void setChemistAnsLike(int chemistAnsLike) {
		this.chemistAnsLike = chemistAnsLike;
	}

	public String getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(String ansDate) {
		this.ansDate = ansDate;
	}

	public int getChemistInCode() {
		return chemistInCode;
	}

	public void setChemistInCode(int chemistInCode) {
		this.chemistInCode = chemistInCode;
	}

	public String getChemistCode() {
		return chemistCode;
	}

	public void setChemistCode(String chemistCode) {
		this.chemistCode = chemistCode;
	}

	public String getChemistInReply() {
		return chemistInReply;
	}

	public void setChemistInReply(String chemistInReply) {
		this.chemistInReply = chemistInReply;
	}

	public String getChemistInAdopt() {
		return chemistInAdopt;
	}

	public void setChemistInAdopt(String chemistInAdopt) {
		this.chemistInAdopt = chemistInAdopt;
	}

	public int getChemistAnsCode() {
		return chemistAnsCode;
	}

	public void setChemistAnsCode(int chemistAnsCode) {
		this.chemistAnsCode = chemistAnsCode;
	}

}
