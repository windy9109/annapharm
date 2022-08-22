package kr.or.annapharm.dto;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author PC-09
 *	개요 : 약사 조제 화면에서 약의 정보를 확인할 수 있게 도와주는 외부 URL을 가져올 때 사용되는 VO객체
 * 	작성자 : 이병진
 */
@SuppressWarnings("serial")
public class ReadMedicineInfoVO implements Serializable {

	private String mdNo;		// 약코드
	private String mdName;		// 약이름
	private String mdEffect;	// 효능효과URL
	private String MdUse;		// 용법용량URL
	private String MdAttention;	// 주의사항URL
	private String mdUrl;		// 안전나라의약품URL


	public String getMdUrl() {
		return mdUrl;
	}
	public void setMdUrl(String mdUrl) {
		this.mdUrl = mdUrl;
	}
	public String getMdName() {
		return mdName;
	}
	public void setMdName(String mdName) {
		this.mdName = mdName;
	}
	public String getMdNo() {
		return mdNo;
	}
	public void setMdNo(String mdNo) {
		this.mdNo = mdNo;
	}
	public String getMdEffect() {
		return mdEffect;
	}
	public void setMdEffect(String mdEffect) {
		this.mdEffect = mdEffect;
	}
	public String getMdUse() {
		return MdUse;
	}
	public void setMdUse(String mdUse) {
		MdUse = mdUse;
	}
	public String getMdAttention() {
		return MdAttention;
	}
	public void setMdAttention(String mdAttention) {
		MdAttention = mdAttention;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
