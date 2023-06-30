<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- spring custom tag--%>
<%@ taglib prefix= "form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h2>input_data.jsp</h2>
  <form:form action="input_result" modelAttribute="testBean1" method="post">
	data1 : <form:input path="data1" type="text"/>
			<form:errors path="data1" />
	data2 : <form:input path="data2" type="text"/>
			<form:errors path="data2" />
	<form:button type="submit">전송</form:button>
  </form:form>


</body>
</html>

<%-- <%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "spring" uri="http://www.springframework.org/tags"%>--%>



