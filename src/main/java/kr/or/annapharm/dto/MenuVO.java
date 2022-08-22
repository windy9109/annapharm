package kr.or.annapharm.dto;

public class MenuVO {

//	private String mcode; //메뉴코드
//	private String mname; //메뉴이름
//	private String murl; //메뉴 url
//	private String micon; //메뉴아이콘
//	private String jText; // javaScript
//	private String upcode; //상위메뉴코드
//	private int mlevel; //메뉴 레벨
//	private int isnav;


	private String mCode    ;
	private String mName    ;
	private String mUrl     ;
	private String mIcon    ;
	private String upCode   ;
	private int isnav    ;
	private String parentId;
	private String sortNo  ;
	private String useYn   ;
	private String depth    ;
	private String collapseYn;





	public String getmCode() {
		return mCode;
	}
	public void setmCode(String mCode) {
		this.mCode = mCode;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmUrl() {
		return mUrl;
	}
	public void setmUrl(String mUrl) {
		this.mUrl = mUrl;
	}
	public String getmIcon() {
		return mIcon;
	}
	public void setmIcon(String mIcon) {
		this.mIcon = mIcon;
	}
	public String getUpCode() {
		return upCode;
	}
	public void setUpCode(String upCode) {
		this.upCode = upCode;
	}
	public int getIsnav() {
		return isnav;
	}
	public void setIsnav(int isnav) {
		this.isnav = isnav;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getSortNo() {
		return sortNo;
	}
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getCollapseYn() {
		return collapseYn;
	}
	public void setCollapseYn(String collapseYn) {
		this.collapseYn = collapseYn;
	}
	@Override
	public String toString() {
		return "MenuVO [mCode=" + mCode + ", mName=" + mName + ", mUrl=" + mUrl + ", mIcon=" + mIcon + ", upCode="
				+ upCode + ", isnav=" + isnav + ", parentId=" + parentId + ", sortNo=" + sortNo + ", useYn=" + useYn
				+ ", depth=" + depth + ", collapseYn=" + collapseYn + "]";
	}












}
