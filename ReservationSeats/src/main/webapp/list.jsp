<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/check.js"></script>
<body>
	<%@ include file="header.jsp" %>
	<div align="center">
	<form name="frm" method="post" action="list_ok.jsp">
	<h3>좌석예약조회</h3>
		<table width="400" border="1">
			<tr>
				<td align="left" width="50%">사원번호를 입력하시오.</td>
				<td align="left" width="50%"><input type="text" name="Empno" maxlength="8"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">	
					<input type="button" value="좌석예약조회" onclick="valid_check()">
					<input type="button" value="홈으로" onclick="home()">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>