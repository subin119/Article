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
	ArticleVO article = articleDao.getArticleAt(articleId);
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= article.getSubject() %></h1>
	<h3><%= article.getCategoryVO().getCategoryName() %></h3>
	<h3>입력 시간 : <%= article.getCreated_Date() %></h3>
	<hr/>
	<p>
		<%= article.getContents() %>
	</p>
	
	<a href="./ArticleDelete.jsp?articleId=<%= article.getArticle_Id() %>">기사 삭제하기</a>
</body>
</html>