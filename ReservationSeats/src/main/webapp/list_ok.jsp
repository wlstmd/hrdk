<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="jdbcCon.Connect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String Empno = request.getParameter("Empno");
		try {
			Connection con = Connect.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select Empno from TBL_EMP_202108 where Empno='"+ Empno +"'";
			ResultSet rs = stmt.executeQuery(sql);
				if (rs.next()) {
		%>
					<script type="text/javascript">
						alert("<%=Empno%> 님의 좌석을 조회합니다");
						location.href="success.jsp?Empno=<%=Empno%>";
					</script>
		<%
				} else {
		%>
					<script type="text/javascript">
						alert("해당 사원에게 정보가 없습니다.");
						location.href="fail.jsp";
					</script>
		<%
				}
		} catch (Exception e) {
		%>
			<script type="text/javascript">
				alert("조회에 실패하였습니다. 다시시도 해주세요.");
				location.href="list.jsp";
			</script>
		<%
		}
	%>
</body>
</html>
