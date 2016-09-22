package com.dat.article.dao;

import java.util.List;

import com.dat.article.vo.ArticleVO;
import com.dat.article.vo.CategoryVO;

public interface ArticleDao {
	
	public List<ArticleVO> getArticles(int categoryId);
	
	public List<CategoryVO> getCategoriesOf(int parentCategoryId);
	
	public boolean isCategoryLeafNode(int categoryId);
	
	public void addNewArticles(ArticleVO articleVO);
	
	public List<CategoryVO> getCategories();
	
	public ArticleVO getArticleAt(int articleId);
	
	public void deleteArticle(int articleId);

}
