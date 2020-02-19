<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		getList();
		
		$j("#ckall").on("click",function(){
			if($j("#ckall").prop("checked")){
				$j("input[name=codeId]").prop("checked",true);
			}else{
				$j("input[name=codeId]").prop("checked",false);
				
			}
			
		});
		
		$j("#checkSearch").on("click",function(){
			getList();
				
		});
	});
	function getList(){
		var $frm = $j(':input');
		var param = $frm.serialize();
		//location.href="/board/boardList.do?pageNo=1&"+param;
		$j.ajax({
		    url : "/board/boardListAjax.do?pageNo=1",
		    dataType: "json",
		    type: "GET",
		    data : param,
		    contentType:"application/json; charset=UTF-8",
		    success: function(data, textStatus, jqXHR)
		    {
		    	var item=data.boardList;
		    	var len=item.length;
		    	var html="";
		    	html+="<tr>";
	    		html+="<td align='right'>";
	    		html+="total : "+data.totalCnt ;
	    		html+="</td> </tr>";
	    		html+="<td>";
	    		html+="<table id='boardTable' border = '1'>";
	    		html+="<tr> <td width='80' align='center'> Type </td> <td width='40' align='center'> No </td> <td width='300' align='center'> Title </td> </tr>";
			
		    	if(len>0){
		    		$j(item).each(function(i,item){
		    			html+="<tr>";
		    			html+="<td align='center'>";
						html+=item.comcodeVo.codeName;
						html+="</td> <td>";
						html+=item.boardNum;
						html+="</td> <td>";
						html+="<a href = '/board/"+item.boardType+"/"+item.boardNum+"/boardView.do?pageNo="+item.pageNo+"'>"+item.boardTitle+"</a>";
						html+="</td>";
			    		html+="</tr>";
		    		});
		    	}
		    	
	    		$j("#testTable").html(html);
	    		$j("#pageNo").value(1);
		    	
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("����");
		    }
		});
	}
	function doCheck(){
		if($j("input[name=codeId]:checked").length==$j("input[name=codeId]").length){
			$j("#ckall").prop("checked",true);
		}else{
			$j("#ckall").prop("checked",false);
		}
			
		
	}
</script>
<body>
<table id=toptap align="center" >
	<tr align="left">
		<td align="left">
			<a href ="/user/userLogin.do">Login</a>
			<a href ="/user/userJoin.do">Join</a>
		</td>
	</tr>
</table> 
<table id="testTable" align="center">

</table>

<table id="checkTable" align="center">
	<tr>
		<td align="left">
			<label><input type="checkbox" id="ckall" name="ck">��ü</label>
			<c:forEach items="${comcodeList}" var="list" varStatus="i">
				<label><input type="checkbox" onclick="doCheck();" id="ck${i.count}" name="codeId" value="${list.codeId}">${list.codeName}</label>
			</c:forEach>
			<input type="button" id="checkSearch" value="����">
		</td>
		<td align="right">
			<a href ="/board/boardWrite.do">�۾���</a>
		</td>
	</tr>
</table>
<table id="pagingTab" align="center">
	<input type="hidden" id="pageNo" value="${pageNo}" >
</table>
	
</body>
</html>