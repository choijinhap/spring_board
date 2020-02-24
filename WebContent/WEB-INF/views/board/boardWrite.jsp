<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			
			if($j("#boardTitle").val()==""){
				alert("제목을 작성하세요");
				$j("boardTitle").focus();
				return false;
			}
			if($j("#boardComment").val()==""){
				alert("내용을 작성하세요");
				$j("boardComment").focus();
				return false;
			}
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			$j.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
		
		$j("#rowplus").on("click",function(){
			var html="<tr><td><table id='table1'border='1'><tr><td width='120' align='center'>Type</td><td width='400'><select name='boardType'><c:forEach items='${comcodeList}' var='list'><option value='${list.codeId}'>${list.codeName}</option></c:forEach></select></td></tr><tr><td width='120' align='center'>Title</td><td width='400'><input name='boardTitle' type='text' size='50' value='${board.boardTitle}'></td></tr><tr><td height='300' align='center'>Comment</td><td valign='top'><textarea name='boardComment' rows='20' cols='55'>${board.boardComment}</textarea></td></tr><tr><td align='center'>Writer</td><td><input name='creator' type='text' size='50' value='${sessionScope.userName}' readonly></td></tr></table></td></tr>";
			$j("#centerTable").append(html);
		});
	});
	

</script>
<body>
<form class="boardWrite">
	<table id="centerTable" align="center">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="작성">
			<input id="rowplus" type="button" value="행추가">
			</td>
		</tr>
		<tr>
			<td>
				<table id="table1" border ="1"> 
					<tr>
						<td width="120" align="center">
						Type
						</td>
						<td width="400">
						<select name="boardType">
							<c:forEach items="${comcodeList}" var="list">
								<option value="${list.codeId}" >${list.codeName}</option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input id="boardTitle" name="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="50" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea id="boardComment"name="boardComment"  rows="5" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
						<input id="creator" name="creator" type="text" size="50" value="${sessionScope.userName}" readonly> 
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>