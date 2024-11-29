<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Copyright KDY</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div align="center">
	<form name="frm1" method="post" action="i_action.jsp">
	<h3>근무좌석예약</h3>
		<table width="400" border="1">
			<tr>
				<td align="left" width="30%">예약번호</td>
				<td align="left" width="70%"><input type="text" name="Resvno" maxlength="8" size="15" /> 예) 20210001</td>
			</tr>
			<tr>
				<td align="left" width="30%">사원번호</td>
				<td align="left" width="70%"><input type="text" name="Empno" maxlength="4" size="15" /> 예) 1001</td>
			</tr>
			<tr>
				<td width="30%" align="left">근무일자</td>
				<td width="70%" align="left"><input type="text" name="Resvdate" maxlength="8" size="15" /> 예) 20211231</td>
			</tr>
			<tr>
				<td align="left" width="30%">좌석번호</td>
				<td align="left" width="70%"><input type="text" name="Seatno" maxlength="4" size="15" /> 예) S001 ~ S009</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="등록" onclick="check()">
					<input type="button" value="다시쓰기" onclick="init()">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
<script type="text/javascript" src="js/check.js"></script>
</html>