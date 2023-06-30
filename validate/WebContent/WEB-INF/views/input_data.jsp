<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h2>input_data.jsp</h2>
  <form action="input_result" method="post">
    data1 : <input type="text" name="data1"/><br>
       <!-- name="testBean1" : requestScope 에 올라간 객체의 이름으로 지정함 -->
    <spring:hasBindErrors name="TestBean1">
    	<c:if test="${errors.hasFieldErrors('data1')}">
    	${errors.getFieldErrors('data1').defaultMessage}<br>
    	</c:if>
    </spring:hasBindErrors>
    data2 : <input type="text" name="data2"/><br>
       <!-- name="testBean1" : requestScope 에 올라간 객체의 이름으로 지정함 -->
        <spring:hasBindErrors name="TestBean1">
    	<c:if test="${errors.hasFieldErrors('data2')}">
    	${errors.getFieldErrors('data2').defaultMessage}<br>
    	</c:if>
    </spring:hasBindErrors>
    <button type="submit">전 송</button>
  </form>
</body>
</html>





