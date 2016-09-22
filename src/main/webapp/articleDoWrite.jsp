<%@page import="com.dat.article.dao.ArticleDaoImpl"%>
<%@page import="com.dat.article.dao.ArticleDao"%>
<%@page import="com.dat.article.vo.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//한글 깨짐 방지를 위한 코드
	request.setCharacterEncoding("UTF-8");

	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	
	//contents의 줄바꿈 문자를 <br/>로 바꾸기
		contents = contents.replaceAll("\n", "<br/>")
						   .replaceAll("\r", "");
	
	String categoryIdParam = request.getParameter("categoryId");
	if(categoryIdParam == null) {
		categoryIdParam = "1";
	}
	
	int categoryId = Integer.parseInt(categoryIdParam);
	
	ArticleVO articleVO = new ArticleVO();
	
	articleVO.setCategoryId(categoryId);
	articleVO.setSubject(subject);
	articleVO.setContents(contents);
	
	ArticleDao articleDao = new ArticleDaoImpl();
	articleDao.addNewArticles(articleVO);
	
	response.sendRedirect("/HelloWeb/Article.jsp");
	
%>