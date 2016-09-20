<%@page import="com.dat.news.vo.NewsVO"%>
<%@page import="com.dat.news.dao.NewsDaoImpl"%>
<%@page import="com.dat.news.dao.NewsDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NewsDao newsDao = new NewsDaoImpl();
	List<NewsVO> newses = newsDao.getNewsesOf(10);
%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>News</h1>
	<hr>
	
	<table style = "width:100%; border-collapse: collapse; border: 1px solid #000000; background-color: #6495ED;">
		<tr style = "height: 50px;">
			<th>NEWS_ID</th>
			<th>Subject</th>
			<th>Contents</th>
			<th>Recommend Count</th>
			<th>Journalist_ID</th>
			<th>Category_ID</th>
			<th>Created Date</th>
		</tr>

<%
	int newsSize = newses.size();
	NewsVO news = null;
	for(int i = 0; i < newsSize; i++) {
		news = newses.get(i);
%>
	<tr style="border-top: 1px solid #cccccc; border-left: 1px solid #000000; color: #FFFFFF";">
		<td style="text-align:center; border-right: 1px solid #cccccc; "><%= news.getNewsId() %></td>
		<td style="text-align:center; border-right: 1px solid #cccccc;"><%= news.getSubject() %></td>
		<td style="text-align:center; border-right: 1px solid #cccccc;"><%= news.getContent() %></td>
		<td style="text-align:center; border-right: 1px solid #cccccc;"><%= news.getRecommendCount() %></td>
		<td style="text-align:center; border-right: 1px solid #cccccc;"><%= news.getJournalistId() %></td>
		<td style="text-align:center; border-right: 1px solid #cccccc;"><%= news.getCategoryId() %></td>
		<td style="text-align:center; border-right:1px solid #000000;"><%= news.getCreatedDate() %></td>
	</tr>
	
<% } %>
</body>
</html>