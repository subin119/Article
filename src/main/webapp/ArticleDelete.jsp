<%@page import="com.dat.article.vo.ArticleVO"%>
<%@page import="com.dat.article.dao.ArticleDaoImpl"%>
<%@page import="com.dat.article.dao.ArticleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String articleIdParam = request.getParameter("articleId");
	if(articleIdParam == null) {
		articleIdParam = "./Article.jsp";
	}
	int articleId = Integer.parseInt(articleIdParam);
	
	ArticleDao articleDao = new ArticleDaoImpl();
	articleDao.deleteArticle(articleId);
	
	response.sendRedirect("./Article.jsp");
%>   