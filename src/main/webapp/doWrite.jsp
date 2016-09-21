<%@page import="com.dat.news.vo.NewsVO"%>
<%@page import="com.dat.news.dao.NewsDaoImpl"%>
<%@page import="com.dat.news.dao.NewsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//기사등록!!
	//한글 깨짐 방지를 위한 코드
	request.setCharacterEncoding("UTF-8");

	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	
	//contents의 줄바꿈 문자를 <br/>로 바꾸기
	contents = contents.replaceAll("\n", "<br/>")
					   .replaceAll("\r", "");
	
	String journalistIdParam = request.getParameter("journalistId");
	if(journalistIdParam == null) {
		journalistIdParam = "1";	
	}
	
	int journalistId = Integer.parseInt(journalistIdParam);
	
	String categoryIdParam = request.getParameter("categoryId");
	if(categoryIdParam == null) {
		categoryIdParam = "1";
	}
	
	int categoryId = Integer.parseInt(categoryIdParam);
	
	NewsVO newsVO = new NewsVO();
	
	newsVO.setCategoryId(categoryId);
	newsVO.setJournalistId(journalistId);
	newsVO.setSubject(subject);
	newsVO.setContent(contents);
	
	NewsDao newsDao = new NewsDaoImpl();
	newsDao.addNewNews(newsVO);
	
	//기사 등록이 완료된 시점에 바로 News.jsp로 이동한다.
	response.sendRedirect("/HelloWeb/News.jsp");
%>
