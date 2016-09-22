<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.dat.news.vo.CategoryVO"%>
<%@page import="com.dat.news.vo.NewsVO"%>
<%@page import="com.dat.news.dao.NewsDaoImpl"%>
<%@page import="com.dat.news.dao.NewsDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String categoryParam = request.getParameter("categoryId");
	String parentCategoryIdParam = request.getParameter("parentCategoryId");
	if(categoryParam == null) {
		categoryParam = "0";		
	}
	if(parentCategoryIdParam == null) {
		parentCategoryIdParam = "0";
	}
	
	int categoryId = Integer.parseInt(categoryParam);
	int parentCategoryId = Integer.parseInt(parentCategoryIdParam);
	
	NewsDao newsDao = new NewsDaoImpl();
	List<CategoryVO> categories = null;
	
	boolean isLeafNode = newsDao.isCategoryLeafNode(categoryId);
	if(isLeafNode) {
		categories = newsDao.getCategoriesOf(parentCategoryId); //부모 카테고리의 하위 카테고리를 가져와라
	}
	else {
		categories = newsDao.getCategoriesOf(categoryId); //하위 카테고리를 가져와라
	}
	
	List<NewsVO> newses = newsDao.getNewsesOf(categoryId);
%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NEWS</title>
</head>
<body>
	<h1>News</h1>
	<hr>
	
	<a href="./News.jsp">처음으로</a>&nbsp;|&nbsp;
<%
	int categoriesSize = categories.size();
	CategoryVO category = null;
	for(int i = 0; i < categoriesSize; i++) {
		category = categories.get(i);
%>	
	<a href="./News.jsp?categoryId=<%= category.getCategoryId()%>&parentCategoryId=<%= category.getParentCategoryiId()%>">
		<%= category.getCategoryName() %>
	</a>&nbsp;|&nbsp;
<% } %>
	<hr/>
	<table style = "width:100%; border-collapse: collapse; border: 1px solid #000000; background-color: #6495ED;">
		<tr style = "height: 50px;">
			<th>NEWS_ID</th>
			<th>Subject</th>
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
	<tr style="border-top: 1px solid #cccccc; border-left: 1px solid #000000; color: #FFFFFF">
		<td style="text-align:center; border-right: 1px solid #cccccc; "><%= news.getNewsId() %></td>
		<td style="text-align:left; border-right: 1px solid #cccccc;">
			<a href="./detail.jsp?newsId=<%= news.getNewsId()%>" ><%= news.getSubject() %></td></a>
		<td style="text-align:center; border-right: 1px solid #cccccc;"><%= news.getRecommendCount() %></td>
		<td style="text-align:center; border-right: 1px solid #cccccc;"><%= news.getJournalistVO().getJournalistName() %></td>
		<td style="text-align:center; border-right: 1px solid #cccccc;"><%= news.getCategoryVO().getCategoryName() %></td>
		<td style="text-align:center; border-right:1px solid #000000;"><%= news.getCreatedDate() %></td>
	</tr>
	
<% } %>
	</table>
<hr/>
<a href="./write.jsp">기사 등록</a>
</body>
</html>