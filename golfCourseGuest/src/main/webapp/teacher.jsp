<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Connect"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강사조회</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <section>
        <h2 align="center">강사조회</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>강사코드</th>
                    <th>강사명</th>
                    <th>강의명</th>
                    <th>수강료</th>
                    <th>강사자격취득일</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                	Connection con = Connect.getConnection();
					Statement stmt = con.createStatement();

					request.setCharacterEncoding("UTF-8");

                    String sql = "SELECT * FROM tbl_teacher_202201";
                    ResultSet rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                    	String teacher_code = rs.getString(1);
            			String teacher_name = rs.getString(2);
            			String class_name = rs.getString(3);
            			
                        int originPrice = rs.getInt("class_price");
                        String formattedPrice = String.format("\\%,d", originPrice);

                        String originDate = rs.getString("teacher_regist_date");
                        String formattedDate = originDate.substring(0, 4) + "년"
                                              + originDate.substring(4, 6) + "월"
                                              + originDate.substring(6, 8) + "일";
                %>
                <tr>
                    <td><%= teacher_code %></td>
                    <td><%= teacher_name %></td>
                    <td><%= class_name %></td>
                    <td><%= formattedPrice %></td>
                    <td><%= formattedDate %></td>
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
    <%@ include file="footer.jsp" %>
</body>
</html>