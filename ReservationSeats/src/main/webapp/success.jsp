<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%
		String Empno = request.getParameter("Empno");
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String sql = "select " +
                "    E.Empno, " +
                "    E.Empname, " +
                "    R.Resvdate, " +
                "    S.Seatno, " +
                "    S.Office, " +
                "    S.Callno " +
             "from TBL_RESV_202108 R " +
             "join TBL_EMP_202108 E " +
                "    on R.Empno = E.Empno " +
             "join TBL_SEAT_202108 S " +
                "    on R.Seatno = S.Seatno " +
             "where E.Empno = '" + Empno + "'";
		rs = stmt.executeQuery(sql);
	%>
	<div align="center">
	<h3>사원번호: <%=Empno %> 님의 좌석예약조회</h3>
		<table border="1" width="700">
			<tr>
				<th>사원번호</th>
				<th>이름</th>
				<th>근무일자</th>
				<th>좌석번호</th>
				<th>좌석위치</th>
				<th>내신번호</th>
			</tr>
			<%
			while(rs.next()){
				String Empname = rs.getString(2);
				String Resvdate = rs.getString(3);
				String Seatno = rs.getString(4);
				String Office = rs.getString(5);
				String Callno = rs.getString(6);
			%>
			<tr>
				<td><%= Empno %></td>
				<td><%= Empname %></td>
				<td><%= Resvdate %></td>
				<td><%= Seatno %></td>
				<td><%= Office %></td>
				<td><%= Callno %></td>
			</tr>
			<%
				}
				rs.close();
				stmt.close();
				con.close();
			%>
		</table>
		&emsp;&emsp;&emsp;<a href="main.jsp"><input type="button" value="돌아가기" /></a>
	</div>
</body>
</html>
