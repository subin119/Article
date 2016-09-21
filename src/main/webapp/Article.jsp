<%@page import="com.dat.article.vo.ArticleVO"%>
<%@page import="java.util.List"%>
<%@page import="com.dat.article.dao.ArticleDaoImpl"%>
<%@page import="com.dat.article.dao.ArticleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	ArticleDao articleDao = new ArticleDaoImpl();
	List<ArticleVO> articles = articleDao.getArticles();

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기사</title>
</head>
<body>
	<h1>Article</h1>
	<hr>

	<a href="./HR.jsp" target= "_blank">HR로 가기</a>
	<hr>
	
	<table style="width: 100%; border-collapse: collapse; border: 1px dashed #000000; background-color: #2E8B57;">
		<tr style="height: 50px;">
			<th>ARTICLE_ID</th>
			<th>SUBJECT</th>
			<th>CONTENTS</th>
			<th>CREATED_DATE</th>
		</tr>
<%
	int articleSize = articles.size();
	ArticleVO article = null;
	for(int i = 0; i < articleSize; i++) {
		article = articles.get(i);
%>		<tr style="height: 20px; text-align: center; background-color: #FFA500">
			<th style="color: #FFFFFF;"><%= article.getArticle_Id()%></th>
			<th style="color: #FF4500;"><%= article.getSubject()%></th>
			<th style="color: #C71585;"><%= article.getContents()%></th>
			<th style="color: #4169E1;"><%= article.getCreated_Date()%></th>
		</tr>
<% } %>
	</table>
</body>
</html>