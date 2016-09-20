package com.dat.article.dao;

import java.util.List;

import com.dat.article.vo.ArticleVO;

public interface ArticleDao {
	
	public List<ArticleVO> getArticles();

}
