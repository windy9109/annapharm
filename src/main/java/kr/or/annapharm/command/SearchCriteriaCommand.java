package kr.or.annapharm.command;

public class SearchCriteriaCommand {

	private String page;
	private String perPageNum;
	private String keyword;
	private String searchType;
	private String searchType2;
	private String startDate;
	private String endDate;
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSearchType2() {
		return searchType2;
	}
	public void setSearchType2(String searchType2) {
		this.searchType2 = searchType2;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = perPageNum;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public SearchCriteria toSearchCriteria() {
		SearchCriteria cri = new SearchCriteria();
		
		if(page !=null && !page.isEmpty() ) {
			cri.setPage(Integer.parseInt(page));				
		}				
		if(perPageNum !=null && !perPageNum.isEmpty()) {
			cri.setPerPageNum(Integer.parseInt(perPageNum));
		}
		
		cri.setSearchType(searchType);
		cri.setSearchType2(searchType2);
		cri.setKeyword(keyword);
		cri.setStartDate(startDate);
		cri.setEndDate(endDate);
		
		return cri;
	}
	
}



