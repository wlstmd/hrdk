<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사매출현황</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<h2 align="center">강사매출현황</h2>
		<table border="1">
			<thead>
				<tr>
					<th>강사코드</th>
					<th>강의명</th>
					<th>강사명</th>
					<th>총매출</th>
				</tr>
			</thead>
			<tbody>
				<%
				try {
					Connection con = Connect.getConnection();
					Statement stmt = con.createStatement();

					request.setCharacterEncoding("UTF-8");

					String sql = "SELECT c.teacher_code, t.class_name, t.teacher_name, " +
				                 "SUM(c.tuition) AS total " +
				                 "FROM TBL_CLASS_202201 c " +
				                 "JOIN TBL_TEACHER_202201 t ON c.teacher_code = t.teacher_code " +
				                 "GROUP BY c.teacher_code, t.class_name, t.teacher_name " +
				                 "ORDER BY c.teacher_code";

					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) {
						String teacher_code = rs.getString("teacher_code");
						String class_name = rs.getString("class_name");
						String teacher_name = rs.getString("teacher_name");
						
						int total = rs.getInt("total");
						String formattedTotal = String.format("\\%,d", total);
				%>
				<tr>
					<td><%=teacher_code%></td>
					<td><%=class_name%></td>
					<td style="text-align:right;"><%=teacher_name%></td>
					<td style="text-align:right;"><%=formattedTotal%></td>
				</tr>
				<%
					}
					rs.close();
					stmt.close();
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
			</tbody>
		</table>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>