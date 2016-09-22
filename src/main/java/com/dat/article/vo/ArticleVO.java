package com.dat.article.vo;

public class ArticleVO {
	
	private int article_Id;
	private String subject;
	private String contents;
	private String created_Date;
	private int categoryId;
	
	private CategoryVO categoryVO;
	
	public ArticleVO() {
		categoryVO = new CategoryVO();
	}
	
	public int getArticle_Id() {
		return article_Id;
	}
	public void setArticle_Id(int article_Id) {
		this.article_Id = article_Id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCreated_Date() {
		return created_Date;
	}
	public void setCreated_Date(String created_Date) {
		this.created_Date = created_Date;
	}

	public CategoryVO getCategoryVO() {
		return categoryVO;
	}

	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	
}
