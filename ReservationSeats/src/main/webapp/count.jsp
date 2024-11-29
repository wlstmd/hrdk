<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h3 align="center">부서별근무일수집계</h3>
	<table border="1" align="center">
		<tr>
			<td>사원번호</td>
			<td>이름</td>
			<td>부서명</td>
			<td>근무일수</td>
		</tr>
		<%
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			Statement stmt = conn.createStatement();
			String sql = "select Empno, Empname, Deptcode, Position from TBL_EMP_202108 order by Empno";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				String Empno = rs.getString(1);
				String Empname = rs.getString(2);
				String Deptcode = rs.getString(3);
				if (Deptcode.equals("10")){
					Deptcode = "영업팀";
				} else if (Deptcode.equals("20")){
					Deptcode = "총무팀";
				} else if (Deptcode.equals("30")){
					Deptcode = "구매팀";
				}
				String Position = rs.getString(4);
		%>
		<tr>
			<td><%=Empno %></td>
			<td><%=Empname %></td>
			<td><%=Deptcode %></td>
			<td><%=Position %></td>
		</tr>
		<%
			}
			rs.close();
			conn.close();
			stmt.close();
		%>
	</table>
</body>
</html>