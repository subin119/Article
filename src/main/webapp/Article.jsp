<%@page import="java.util.ArrayList"%>
<%@page import="com.dat.article.vo.CategoryVO"%>
<%@page import="com.dat.article.vo.ArticleVO"%>
<%@page import="java.util.List"%>
<%@page import="com.dat.article.dao.ArticleDaoImpl"%>
<%@page import="com.dat.article.dao.ArticleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	String categoryParam = request.getParameter("categoryId");
	String parentCategoryParam = request.getParameter("parentCategoryId");
	
	if(categoryParam == null) {
		categoryParam = "0";
	}
	if(parentCategoryParam == null) {
		parentCategoryParam = "0";
	}
	
	int categoryId = Integer.parseInt(categoryParam);
	int parentCategoryId = Integer.parseInt(parentCategoryParam);
	
	
	ArticleDao articleDao = new ArticleDaoImpl();
	
	List<CategoryVO> categories = null;
	
	boolean isLeafNode = articleDao.isCategoryLeafNode(categoryId);
	if(isLeafNode) {
		categories = articleDao.getCategoriesOf(parentCategoryId);
	}
	else {
		categories = articleDao.getCategoriesOf(categoryId);
	}
	
	List<ArticleVO> articles = articleDao.getArticles(categoryId);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기사</title>
</head>
<body>
	<h1>Article</h1>
	<hr>

	<a href="./Article.jsp">처음으로 </a>&nbsp;|&nbsp;
<%
	int categoriesSize = categories.size();
	CategoryVO categoryVO = null;
	for(int i = 0; i < categoriesSize; i++) {
		categoryVO = categories.get(i);
%>
	<a href="./Article.jsp?categoryId=<%= categoryVO.getCategoryId()%>&parentCategoryId=<%= categoryVO.getParentCategoryId()%>">
		<%= categoryVO.getCategoryName() %>
	</a>&nbsp;|&nbsp;
<% } %>


	<hr/>
	<table style="width: 100%; border-collapse: collapse; border: 1px dashed #000000; background-color: #2E8B57;">
		<tr style="height: 50px;">
			<th>ARTICLE_ID</th>
			<th>SUBJECT</th>
			<th>CONTENTS</th>
			<th>CTGR_ID</th>
			<th>CREATED_DATE</th>
		</tr>
		
<%
	int articleSize = articles.size();
	ArticleVO article = null;
	for(int i = 0; i < articleSize; i++) {
		article = articles.get(i);
%>	
	<tr style="height: 20px; text-align: center; background-color: #FFA500">
			<th style="color: #FFFFFF;"><%= article.getArticle_Id()%></th>
			<th style="color: #FF4500;">
				<a href="./ArticleDetail.jsp?articleId=<%= article.getArticle_Id()%>" ><%= article.getSubject()%></th></a>
			<th style="color: #C71585;"><%= article.getContents()%></th>
			<th style="color: #FFFFFF;"><%= article.getCategoryVO().getCategoryName()%></th>
			<th style="color: #4169E1;"><%= article.getCreated_Date()%></th>
		</tr>
<% } %>
</table>
<hr/>
	<a href="./articleWrite.jsp">기사 등록</a>
</body>
</html>