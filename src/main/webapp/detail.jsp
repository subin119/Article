<%@page import="com.dat.news.vo.NewsVO"%>
<%@page import="com.dat.news.dao.NewsDaoImpl"%>
<%@page import="com.dat.news.dao.NewsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String newsIdParam = request.getParameter("newsId");

	//만약, newsId가 없을 경우 news.jsp로 돌려보낸다.
	if(newsIdParam == null) {
		response.sendRedirect("./News.jsp");
	}
	int newsId = Integer.parseInt(newsIdParam);
	
	//조회수 증가시킨다.
	NewsDao newsDao = new NewsDaoImpl();
	newsDao.updateRecommendCount(newsId);
	
	//기사의 내용을 가져온다.
	NewsVO news = newsDao.getNewsAt(newsId);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1><%= news.getSubject() %></h1>
	<h3><%= news.getJournalistVO().getJournalistName() %></h3>
	<h3><%= news.getCategoryVO().getCategoryName() %></h3>
	<h3><%= news.getCreatedDate() %></h3>
	<h3><%= news.getRecommendCount() %></h3>
	<hr/>
	<p>
		<%= news.getContent() %>
	</p>
	
	<a href="./delete.jsp?newsId=<%= news.getNewsId() %>">기사 삭제하기</a>
</body>
</html>