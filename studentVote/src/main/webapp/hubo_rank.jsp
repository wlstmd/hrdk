<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보자등수 조회</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<table width="200" border="1">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>총득표수</td>
			</tr>
			<%
			Connection con = Connect.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = null;
			String sql = "select r.no, r.name, count(v.choice_no) as count" + " from tbl_register r join tbl_vote v"
					+ " on r.no = v.choice_no" + " group by r.no, r.name" + " order by count(v.choice_no) desc, r.no asc";

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String no = rs.getString(1);
				String name = rs.getString(2);
				String total = rs.getString(3);
			%>
			<tr>
				<td><%=no%></td>
				<td><%=name%></td>
				<td><%=total%></td>
			</tr>
			<%
			}

			stmt.close();
			con.close();
			rs.close();
			%>
		</table>
		&emsp;&emsp;&emsp;<a href="index.jsp">홈으로</a>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>