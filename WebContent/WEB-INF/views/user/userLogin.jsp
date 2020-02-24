<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {
		$j("form").bind("submit",function() {
		
			if(formIdCheck()&&formPwCheck()){
				return true;
				//location.href="/board/boardList.do";
			}
			else{
				return false;
				}
		});
	
	});
	
	function formIdCheck() {
		var id = $j("#userId");
		var param = id.serialize();
		var r="";
		$j.ajax({
			url : "/user/userIdCheck.do",
			dataType : "json",
			type : "POST",
			data : param,
			async :false,
			success : function(data, textStatus, jqXHR) {
				if (data.duplicated == 0) {
					r=true;
				} else {
					alert("없는 ID 입니다.");
					r=false;
				}

			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("실패");
				r=false;
			}
		});
		return r;

	}
	function formPwCheck() {
		var $frm = $j(':input');
		var param = $frm.serialize();
		var r="";
		$j.ajax({
			url : "/user/userPwCheck.do",
			dataType : "json",
			type : "POST",
			data : param,
			async :false,
			success : function(data, textStatus, jqXHR) {
				if (data.success == 1) {
					r=true;
				} else {
					alert("일치하는 id pw가 없습니다");
					r=false;
				}

			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("실패");
				r=false;
			}
		});
		return r;

	}
</script>
<body>
	<form id="userLogin" class="userLogin" name="login" method="post" action="/user/loginCheck.do" >

		<table border="1" align="center">
			<tr>
				<td>id</td>
				<td><input type="text" size="20" name="userId" id="userId"></td>
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" maxlength="12" size="20" name="userPw" id="userPw"></td>
			</tr>
			
			<tr>
				<td align="right"><input id="submit" type="submit" value="login">
				</td>
			</tr>
		</table>
	</form>


</body>
</html>