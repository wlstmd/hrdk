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
<%@ include file="header.jsp" %>
	<%
		try{
			Connection con = Connect.getConnection();
			String sql = "insert into TBL_RESV_202108 values(?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			String Resvno = request.getParameter("Resvno");
			String Empno = request.getParameter("Empno");
			String Resvdate = request.getParameter("Resvdate");
			String Seatno = request.getParameter("Seatno");
					
			pstmt.setString(1, Resvno);
			pstmt.setString(2, Empno);
			pstmt.setString(3, Resvdate);
			pstmt.setString(4, Seatno);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
	%>
	<script>
		alert("<%=Resvno%>번호로 예약되었습니다.");
		location.href="main.jsp";
	</script>
	<%
		} catch (Exception e) {
			%>
			<script>
				alert("예약에 실패하였습니다.");
				location.href="insert.jsp";
			</script>
			<%
		}
	%>
</body>
</html>