<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표결과조회</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<table width="620" border="1">
			<tr>
				<td>이름</td>
				<td>생년월일</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
			</tr>
			<%
			try {
				Connection con = Connect.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = null;
				String sql = "select * from tbl_vote";

				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					String name = rs.getString(2);
					String birth = rs.getString(1);
					String gender = "";
					String year = birth.substring(6, 7);
					switch (year) {
					case "1":
				gender = "남";
				year = "19" + birth.substring(0, 2);
				break;
					case "2":
				gender = "여";
				year = "19" + birth.substring(0, 2);
				break;
					case "3":
				gender = "남";
				year = "20" + birth.substring(0, 2);
				break;
					case "4":
				gender = "여";
				year = "20" + birth.substring(0, 2);
				break;
					}
					birth = year + "년" + birth.substring(2, 4) + "월" + birth.substring(4, 6) + "일";
					String choice_no = rs.getString(3);
					String time = rs.getString(4);
					String confirm = rs.getString(6);
					if (confirm.equals("Y")) {
				confirm = "동의";
					} else
				confirm = "미동의";
			%>
			<tr>
				<td><%=name%></td>
				<td><%=birth%></td>
				<td><%=gender%></td>
				<td><%=choice_no%></td>
				<td><%=time%></td>
				<td><%=confirm%></td>
			</tr>
			<%
			}
			con.close();
			stmt.close();
			rs.close();

			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</table>
		<a href="index.jsp">홈으로</a>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>