package com.project.util;

public class PageNavigator {

	private boolean nowFirst;
	private boolean nowEnd;
	private int totalArticleCount;
	private int totalPageCount;
	private int pageNo;
	private String navigator;
	
	
	public boolean isNowFirst() {
		return nowFirst;
	}
	public void setNowFirst(boolean nowFirst) {
		this.nowFirst = nowFirst;
	}
	public boolean isNowEnd() {
		return nowEnd;
	}
	public void setNowEnd(boolean nowEnd) {
		this.nowEnd = nowEnd;
	}
	public int getTotalArticleCount() {
		return totalArticleCount;
	}
	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getNavigator() {
		return navigator;
	}
	public void setNavigator(String navigator) {
		this.navigator = navigator;
	}
	
	public void makeNavigator() {
		StringBuffer divNavigator = new StringBuffer();
		
		int listSize = 12;
		int pageSize = 5;
		
		int preLastNo = 0;
		
		divNavigator.append("<div class=\"row clearfix\">");
		divNavigator.append("	<div class=\"row\" align=\"center\">");
		divNavigator.append("	<ul class=\"pagination\">");
		
		if(this.isNowFirst()) {
			divNavigator.append("<li class=\"disabled\"><a href=\"#\">&laquo;</a></li>");
		} else {
			preLastNo = (pageNo - 1) / pageSize * pageSize;
			divNavigator.append("<li><a href=\"javascript:firstArticle(" + preLastNo + ")\">&laquo;</a></li>");
		}
		
		int startPage = preLastNo + 1;
		int endPage = preLastNo + pageSize;
		if(endPage > totalPageCount)
			endPage = totalPageCount;
		
		for(int i=startPage; i<=endPage; i++) {
			if(pageNo == i) {
				divNavigator.append("<li class=\"active\"><a href=\"javascript:listArticle(" + i + ")\">" + i + "</a></li>");
			} else {
				divNavigator.append("<li><a href=\"javascript:listArticle(" + i + ")\">" + i + "</a></li>");
			}
		}
		
		if(this.isNowEnd()) {
			divNavigator.append("<li class=\"disabled\"><a href=\"#\">&raquo;</a></li>");
		} else {
			int nextFirstNo = endPage + 1;
			divNavigator.append("<li><a href=\"javascript:firstArticle(" + nextFirstNo + ")\">&raquo;</a></li>");
		}
		
		divNavigator.append("	</ul>");
		divNavigator.append("	</div>");
		divNavigator.append("</div>");
		
		this.navigator = divNavigator.toString();
	}

}
