<%@page import="com.dat.article.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page import="com.dat.article.dao.ArticleDaoImpl"%>
<%@page import="com.dat.article.dao.ArticleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArticleDao articleDao = new ArticleDaoImpl();

	List<CategoryVO> categories = articleDao.getCategories();
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기사 작성</title>
</head>
<body>
	기사등록
	<hr/>
	<form name= "writeForm" method="post" action="./articleDoWrite.jsp">
		<select name="categoryId">
			<option>원하시는 카테고리를 선택하세요</option>
			<%
				for(CategoryVO categoryVO : categories) {
			%>
			<option value= "<%= categoryVO.getCategoryId() %>">
						    <%= categoryVO.getCategoryName() %>
			</option>
		<% } %>
		</select><br/>
		제목 : <input type= "text" 
						 name= "subject" 
						 placeholder= "기사 제목을 입력하세요."
						 style= "width: 500px"/><br/>
		내용 : <textarea name= "contents" 
							placeholder= "기사 내용을 입력하세요."
						    style= "width:500px; 
							height: 200px"></textarea><br/>
		<input type="submit" value= "기사등록"/>			
	</form>
</body>
</html>