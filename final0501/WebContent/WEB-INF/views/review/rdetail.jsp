<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<style>
#ccdetail_main{
margin-left:100px;
margin-right:20px;
}
table th,td{
border: 1px solid black;
text-align: center;
}
button{
text-align: center;
align: center;
}


</style>

<div id = "ccdetail_main">
<h2>�ı� �󼼺���</h2>

<table>
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
	<tr>
		<td>���̵�</td>
		<td>${dto.mid}</td>
	</tr>
	<tr>
		<td>��ǰ�̸�</td>
		<td>${dto.pname}</td>
	</tr>
	<tr>
		<td>�������</td>
		<td>${dto.rdate}</td>
	</tr>
	<tr>
		<td>����</td>
		<td>${dto.title}</td>
	</tr>
	<tr>
		<td>����</td>
		<td><img src="upload/${dto.pic0}"></td>
	</tr>
	<tr>
		<td>����</td>
		<td><textarea rows="10" cols="50" name="content" id="_content">${dto.content}</textarea></td>
	</tr>
</table><br>
<span><button onclick="location.href='ccupdate.do?wiseq=${ccd.wiseq}'">�����ϱ�</button></span>
<br>

</div>