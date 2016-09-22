<%@page import="com.dat.news.vo.CategoryVO"%>
<%@page import="com.dat.news.vo.JournalistVO"%>
<%@page import="java.util.List"%>
<%@page import="com.dat.news.dao.NewsDaoImpl"%>
<%@page import="com.dat.news.dao.NewsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NewsDao newsDao = new NewsDaoImpl();
	//모든 기자 가져오기
	List<JournalistVO> journalists = newsDao.getJournalists();
	
	//모든 카테고리 가져오기
	List<CategoryVO> categories = newsDao.getCategories();
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기사 작성하기</title>
</head>
<body>

	<!-- form tag 안에서는 아래의 태그만 유효하다.
		 input, textarea, select
		 그외의 다른 태그들은 Design만 담당한다.
	 -->	
	<form name= "writeForm" method="post" action="./doWrite.jsp">
		<select name="journalistId">
			<option>원하시는 기자를 선택하세요.</option>
			<%
				for(JournalistVO journalistVO : journalists) {					
			%>
			<option value="<%= journalistVO.getJournalistId() %>">
						   <%= journalistVO.getJournalistName() %>
			</option>
		<% } %>
		</select>
		<select name= "categoryId">
			<option>원하시는 카테고리를 선택하세요.</option>
			<%
				for(CategoryVO categoryVO : categories) {
			%>
			<option value= "<%= categoryVO.getCategoryId() %>">
							<%= categoryVO.getCategoryName() %>
			</option>
		<% } %>	
		</select><br/>
		기사 제목 : <input type= "text" 
						 name= "subject" 
						 placeholder= "기사 제목을 입력하세요."
						 style= "width: 500px"/><br/>
		기사 내용 : <textarea name= "contents" 
							placeholder= "기사 내용을 입력하세요."
						    style= "width:500px; 
							height: 200px"></textarea><br/>
		<input type="submit" value= "기사등록"/>			
	</form>
</body>
</html>