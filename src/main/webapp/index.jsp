<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	String name = request.getParameter("name");
	if(name == null) {
		name = "����";
	}
	
	int nameSize = name.length();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Index</title>
</head>
<body>
	<a href="./HR.jsp" target= "_blank">HR</a>
	<hr>

	Hi~!<%= name %>��!!<br/>
	src/main/webapp �Ʒ��� index.jsp�� ����� ������,�ּҿ� index.jsp�� ���� �ʾƵ� �ٷ� �� �� �ֽ��ϴ�.�ٸ� file�̸��� ����Ѵٸ�, �ּҿ� ���ϸ��, jsp�� ����� �մϴ�.<br/>
	jsp ������ �߰�/����/�������� �� ������ ����� ���� �ʾƵ� ���������� ��� Ȯ���� �� �ֽ��ϴ�.<br/>
	
	
</body>
</html>