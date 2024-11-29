<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보 등록 처리</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	String name = "";
	try {
	Connection con = Connect.getConnection();
	PreparedStatement pstmt = null;
	String sql = "insert into TBL_REGISTER values(?,?,?,?,?,?)";

	pstmt = con.prepareStatement(sql);

	String no = request.getParameter("no");
	name = request.getParameter("name");
	String p_code = request.getParameter("p_code");
	String school = request.getParameter("school");
	String jumin = request.getParameter("jumin1") + request.getParameter("jumin2");
	String major = request.getParameter("major");

	pstmt.setString(1, no);
	pstmt.setString(2, name);
	pstmt.setString(3, p_code);
	pstmt.setString(4, school);
	pstmt.setString(5, jumin);
	pstmt.setString(6, major);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	}
	
	catch(Exception e) {
		e.printStackTrace(); 
	}
	%>

	<h2><%=name%>님의 후보등록이 완료되었습니다.</h2>
	<br> <a href="index.jsp">홈으로</a>
	<jsp:include page="footer.jsp" />
</body>
</html>