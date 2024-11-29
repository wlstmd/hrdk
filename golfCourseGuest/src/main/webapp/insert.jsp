<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div align="center">
		<h2>수강신청</h2>
		<form name="frm1" action="insert_ok.jsp" method="post">
			<table width="550" height="250" border="1" style="border-collapse: collapse;">
				<tr>
					<td width="20%" align="center">수강월</td>
					<td width="60%" align="left">
					<input type="text" size="20" maxlength="6" name="regist_month"> 2022년03월 예)202203</td>
				</tr>
				<tr>
					<td width="20%" align="center">회원명</td>
					<td width="60%" align="left">
					<select name="c_name" style="width: 160px;" onchange="change1();">
							<option value="">회원명</option>
							<option value="10001">홍길동</option>
							<option value="10002">장발장</option>
							<option value="10003">임꺽정</option>
							<option value="20001">성춘향</option>
							<option value="20002">이몽룡</option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" align="center">회원번호</td>
					<td width="60%" align="left">
					<input type="text" size="20" maxlength="5" name="c_no" readonly> 예)10001</td>
				</tr>
				<tr>
					<td width="20%" align="center">강의장소</td>
					<td width="60%" align="left">
					<select name="class_area" style="width: 160px;">
							<option value="">강의장소</option>
							<option value="서울본원">서울본원</option>
							<option value="성남분원">성남분원</option>
							<option value="대전분원">대전분원</option>
							<option value="부산분원">부산분원</option>
							<option value="대구분원">대구분원</option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" align="center">강의명</td>
					<td width="60%" align="left">
					<select name="class_name" style="width: 160px;" onchange="change2();">
							<option value="">강의신청</option>
							<option value="100">초급반</option>
							<option value="200">중급반</option>
							<option value="300">고급반</option>
							<option value="400">심화반</option>
					</select></td>
				</tr>
				<tr>
					<td width="20%" align="center">수강료</td>
					<td width="60%" align="left">
					<input type="text" size="20" maxlength="8" name="tuition" readonly> 원
					<input type="hidden" name="teacher_code">
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<input style="margin-right: 2px" type="button" value="수강신청" onclick="valid_check()"> 
					<input type="button" value="다시쓰기" onclick="reset()"></td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
	
	<script type="text/javascript">
	function valid_check() {
		if (document.frm1.regist_month.value == "") {
			alert("수강월이 입력되지 않았습니다");
			document.frm1.regist_month.focus();
			return false;
		} else if (document.frm1.c_name.value == "") {
			alert("회원명이 입력되지 않았습니다");
			document.frm1.c_name.focus();
			return false;
		} else if (document.frm1.class_area.value == "") {
			alert("강의장소가 입력되지 않았습니다");
			document.frm1.class_area.focus();
			return false;
		} else if (document.frm1.class_name.value == "") {
			alert("강의명이 입력되지 않았습니다");
			document.frm1.class_name.focus();
			return false;
		} else document.frm1.submit();
	}

	function reset(){
		if(confirm("정보를 지우고 처음부터 다시 입력합니다!")){
			location="insert.jsp";
		}
	}

	function change1() {
	    const c_name = document.frm1.c_name;
	    const c_no = document.frm1.c_no;
	    c_no.value = c_name.value;
	    change2();
	}

	function change2() {
		const c_no = document.frm1.c_no.value;
		const class_name = document.frm1.class_name.value;
		
		let price = 0;
		let teacher_code = "";

		if (class_name === "100") {
			price = 100000;
			teacher_code = "100";
		} else if (class_name === "200") {
			price = 200000;
			teacher_code = "200";
		} else if (class_name === "300") {
			price = 300000;
			teacher_code = "300";
		} else if (class_name === "400") {
			price = 400000;
			teacher_code = "400";
		}

		if (parseInt(c_no) >= 20000) {
			price *= 0.5;
		}

		document.frm1.tuition.value = price;
		document.frm1.teacher_code.value = teacher_code;
	}
	</script>
</body>
</html>