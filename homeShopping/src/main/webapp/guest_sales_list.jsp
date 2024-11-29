<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h2 align="center">회원매출조회</h2>
	<table align="center" border="1">
		<tr>
			<td align="center" width="100">회원번호</td>
			<td align="center" width="100">회원성명</td>
			<td align="center" width="120">고객등급</td>
			<td align="center" width="120">매출</td>
		</tr>
		<%
		Connection con = Connect.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String sql = "select m.custno, m.custname, m.grade, SUM(mt.price) AS price " + "from member_tbl_02 m "
				+ "join money_tbl_02 mt on m.custno = mt.custno " + "group by m.custno, m.custname, m.grade "
				+ "order by price desc";
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
			String custno = rs.getString(1);
			String custname = rs.getString(2);
			String grade = rs.getString(3);
			int price = rs.getInt(4);
			switch (grade) {
			case "A":
				grade = "VIP";
				break;
			case "B":
				grade = "일반";
				break;
			case "C":
				grade = "직원";
				break;
			}
		%>
		<tr>
			<td align="center"><%=custno%></td>
			<td align="center"><%=custname%></td>
			<td align="center"><%=grade%></td>
			<td align="center"><%=price%></td>
		</tr>
		<%
		}
		con.close();
		stmt.close();
		rs.close();
		%>
	</table>
	<%@ include file="footer.jsp"%>
</body>
</html>