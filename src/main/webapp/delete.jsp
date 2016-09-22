<%@page import="com.dat.news.dao.NewsDao"%>
<%@page import="com.dat.news.dao.NewsDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String newsIdParam = request.getParameter("newsId");
	if(newsIdParam == null) {
		response.sendRedirect("./detail.jsp");
	}
	int newsId = Integer.parseInt(newsIdParam);
	
	NewsDao newsDao = new NewsDaoImpl();
	
	newsDao.deleteNews(newsId);
	
	response.sendRedirect("./News.jsp");
%>
