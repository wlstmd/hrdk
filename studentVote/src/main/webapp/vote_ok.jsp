<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote_Ok</title>
</head>
<body>
<%
String v_name = "";
try {
Connection con = Connect.getConnection();
String sql = "insert into tbl_vote values (?,?,?,?,?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);

String v_jumin = request.getParameter("v_jumin");
	   v_name = request.getParameter("v_name");
String choice_no = request.getParameter("choice_no");
String v_time = request.getParameter("v_time");
String v_area = request.getParameter("v_area");
String v_confirm = request.getParameter("v_confirm");

pstmt.setString(1, v_jumin);
pstmt.setString(2, v_name);
pstmt.setString(3, choice_no);
pstmt.setString(4, v_time);
pstmt.setString(5, v_area);
pstmt.setString(6, v_confirm);

pstmt.executeUpdate();

con.close();
pstmt.close();

} catch (Exception e) {
	e.printStackTrace();
}
%>

<h2><%=v_name%>님의 후보등록이 완료되었습니다.</h2>
<br>
<a href="index.jsp">홈으로</a>
</body>
</html>