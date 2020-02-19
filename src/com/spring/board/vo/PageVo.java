package com.spring.board.vo;

public class PageVo {
	
	private int pageNo = 1;
	private String[] codeId;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public String[] getcodeId() {
		return codeId;
	}

	public void setcodeId(String[] codeId) {
		this.codeId = codeId;
	}
	
}
