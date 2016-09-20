package com.dat.news.vo;

/**
 * 카테고리 테이블(CTRG)의 칼럼을 모두 멤버변수로 가진다.
 * @author 206-019
 *
 */

public class CategoryVO {
	
	private int categoryId;
	private String categoryName;
	private int parentCategoryiId;
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getParentCategoryiId() {
		return parentCategoryiId;
	}
	public void setParentCategoryiId(int parentCategoryiId) {
		this.parentCategoryiId = parentCategoryiId;
	}
	
	
	

}
