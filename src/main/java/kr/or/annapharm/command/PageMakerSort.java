package kr.or.annapharm.command;

@SuppressWarnings("serial")
public class PageMakerSort extends PageMaker {
	
	String sortTarget;
	String sortType;
	/**
	 * @return the sortTarget
	 */
	public String getSortTarget() {
		return sortTarget;
	}
	/**
	 * @param sortTarget the sortTarget to set
	 */
	public void setSortTarget(String sortTarget) {
		this.sortTarget = sortTarget;
	}
	/**
	 * @return the sortType
	 */
	public String getSortType() {
		return sortType;
	}
	/**
	 * @param sortType the sortType to set
	 */
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	
	
}
