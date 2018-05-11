<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
    
<style>
.main{
	width: 90%;
	height: 100%;
	background-color: white;
	margin : 0 auto;
	align: center;
	text-align: center;
	margin-top: 50px;
	margin-left: 300px;
}
 table { 
 	border: 1px solid #EBEBEB; 
 	width: 70%;
 }
 td font{
	font-size:12px;color:#0000ff;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
tr{
	height: 60px;
	padding:  20px 20px;
}
td{
	 align-content: center;
}
td:nth-child(even) {
    background-color:white;
}
button{
text-align: center;
align: center;
width: 100px;
}
img{
	width:200px;
height:170px;
}

</style>    
    
<form name="frmForm" id="_frmForm" action="cdupdate.do?cdseq=${dto.cdseq}" method="post" 
enctype="multipart/form-data">
<div class="main">
<table>
<colgroup>
		<col width="100"/><col width="300"/>
	</colgroup>
	<tr>
		<td>��üID</td>
		<td>${dto.cid}</td>
	</tr>
	<tr>
		<td>ûø���̸�</td>
		<td>${dto.title}</td>
	</tr>
	<tr>
		<td>ûø������</td>
		<td>
		<c:if test="${dto.category eq 'mobile'}">
			�����
		</c:if>
		<c:if test="${dto.category eq 'analog'}">	
			�Ƴ��α�
		</c:if>
		</td>
		
	</tr>
	<tr>
		<td>����</td>
		<td>
		<c:if test="${dto.cbag eq 2}">
			��������
		</c:if>
		<c:if test="${dto.cbag eq 1}">
			��������
		</c:if>
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td>${dto.price}</td>
	</tr>
	<tr>
		<td>ûø��ũ��</td>
		<td>
		<c:if test="${dto.cardsize eq 'recwidth' }">
		���簢��(����)(171*116mm)
		</c:if>
		<c:if test="${dto.cardsize eq 'recheight' }">
		���簢��(����)(116*171mm)
		</c:if>
		<c:if test="${dto.cardsize eq 'square' }">
		���簢��(141*141mm)
		</c:if>
		</td>
	</tr>
	<tr>
		<td>���λ���</td>
		<td><img src = "upload/${dto.picture0}"/></td>
	<tr>
	    <td>����1</td>
	    <td><img src = "upload/${dto.picture1}"/></td>
	</tr>
	<tr>
	    <td>����2</td>
	    <td><img src = "upload/${dto.picture2}"/></td>
	</tr>
	<tr>
	    <td>����3</td>
	    <td><img src = "upload/${dto.picture3}"/></td>
	</tr>
	   </table>

<button id = "card_update">�����ϱ�</button>
<button id="ccdelete">�����ϱ�</button>
</div>
</form>

<script>
$("#card_update").click(function() {
	alert('�����ϱ�');
	$("#_frmForm").attr({ "target":"_self", "action":"cdupdate.do?cdseq=${dto.cdseq}"}).submit();
});

$("#ccdelete").click(function() {
	alert('�����ϱ�');
	$("#_frmForm").attr({ "target":"_self", "action":"ccdelete.do?cdseq=${dto.cdseq}"}).submit();
});

</script>