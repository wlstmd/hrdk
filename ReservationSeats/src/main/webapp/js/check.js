function check() {
	if(document.frm1.Resvno.value == ""){
		alert("예약번호를 입력해주세요.");
		document.frm1.Resvno.focus();
		return false;
	} else if(document.frm1.Empno.value == ""){
		alert("사원번호를 입력해주세요.");
		document.frm1.Empno.focus();
		return false;
	} else if(document.frm1.Resvdate.value == ""){
		alert("근무일자를 입력해주세요.");
		document.frm1.Resvdate.focus();
		return false;
	} else if(document.frm1.Seatno.value == ""){
		alert("좌석번호를 입력해주세요.");
		document.frm1.Seatno.focus();
		return false;
	}
	document.frm1.submit();
}

function init(){
	document.frm1.Resvno.value = "";
	document.frm1.Empno.value = "";
	document.frm1.Resvdate.value = "";
	document.frm1.Seatno.value = "";
}

function valid_check(){
	if(document.frm.Empno.value == ""){
		alert("사원번호가 입력되지 않았습니다.");
		document.frm.Empno.focus();
		return false;
	}
	document.frm.submit();
}

function home() {
	alert("홈으로 이동합니다.");
	location.href="main.jsp";
}