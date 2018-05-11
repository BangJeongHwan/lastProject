<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
    
    
<form name="frmForm" id="_frmForm" action="cdupdateAf.do?cdseq=${dto.cdseq}" method="post" 
enctype="multipart/form-data">
<table>
	<tr>
		<td>��üID</td>
		<td><input type="text" name = "cid" value="${cdd.cid}"></td>
	</tr>
	<tr>
		<td>ûø���̸�</td>
		<td><input type="text" name = "cname" value="${cdd.cname}"></td>
	</tr>
	<tr>
		<td>ûø������</td>
		<td>
		<input type="text" name = "category" value="${cdd.category}">
		</td>
		
	</tr>
	<tr>
		<td>����</td>
		<td>
		<input type="text" name = "cbag" value="${cdd.cbag}">
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td><input type="text" name = "price" value="${cdd.price}"></td>
	</tr>
	<tr>
		<td>ûø��ũ��</td>
		<td>
		<input type="text" name = "cardsize" value="${cdd.cardsize}">
		</td>
	</tr>
	<tr>
		<td>���λ���</td>
		<td id="_fileTd" colspan="3">
						<button type="button" id="_fileBtn" onclick="fileBtn()">���� ����</button>&nbsp;<font>�ִ� 4������ �����մϴ�.</font><br>
						<!--  style="display:none;" -->
						<input type="text" name="fileNameList[0]" id="_fileNameList0" value="">
						<input type="text" name="fileNameList[1]" id="_fileNameList1" value="">
						<input type="text" name="fileNameList[2]" id="_fileNameList2" value="">
						<input type="text" name="fileNameList[3]" id="_fileNameList3" value="">
						
						<input type="file" name="fileList[0]" id="_fileList0" onchange="fileSelect(0)" style="display:none;">
						<input type="file" name="fileList[1]" id="_fileList1" onchange="fileSelect(1)" style="display:none;">
						<input type="file" name="fileList[2]" id="_fileList2" onchange="fileSelect(2)" style="display:none;">
						<input type="file" name="fileList[3]" id="_fileList3" onchange="fileSelect(3)" style="display:none;">
						<div id="_fileNameDiv" style="height:260px; padding:10px; border:1px solic black;"></div>
		</td>				
	</tr>
	<tr>
		<td>�Ұ���</td>
		<td><input type="text" name="content" value="${cdd.content}"></td>
	</tr>
	
	
<!-- 	<tr> -->
<!-- 	    <td>����1</td> -->
<%-- 	    <td style="text-align: left"><input type="text" name='filename' value="${cdd.picture1}" size="50" readonly="readonly"/> --%>
<!-- 	<input type="file" name="pname"  style=" width : 400px;"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 	    <td>����2</td> -->
<%-- 	    <td style="text-align: left"><input type="text" name='filename' value="${cdd.picture2}" size="50" readonly="readonly"/> --%>
<!-- 	<input type="file" name="pname"  style=" width : 400px;"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 	    <td>����3</td> -->
<%-- 	    <td style="text-align: left"><input type="text" name='filename' value="${cdd.picture3}" size="50" readonly="readonly"/> --%>
<!-- 	<input type="file" name="pname"  style=" width : 400px;"></td> -->
<!-- 	</tr> -->
	   </table>

<button id = "card_update">�����ϱ�</button>
<button id="ccdelete">�����ϱ�</button>
</form>

<script>
$("#card_update").click(function() {
	alert('�����ϱ�');
	$("#_frmForm").submit();
});

$("#ccdelete").click(function() {
	alert('�����ϱ�');
	$("#_frmForm").attr({ "target":"_self", "action":"ccdelete.do?cdseq=${dto.cdseq}"}).submit();
});

//���� ���ù�ư Ŭ����
function fileBtn() {
	for (var i = 0; i < fileNameArray.length; i++) {
		if (fileNameArray[i] == "") {
			var inputFileId = "#_fileList" + i;
			$(inputFileId).click();
			break;
		}
	}
}

//���ϼ��ý�
function fileSelect(selectFileIndex) {
	if (fileNameArray[selectFileIndex] == "") {
		fileSize++;
	}
	var inputFileId = "#_fileList" + selectFileIndex;
	var path = $(inputFileId).val();
	var idx = path.lastIndexOf("\\");
	if (idx == -1) {
		idx = path.lastIndexOf("/");
	}
	var fileName = path.substring(idx + 1);
	
	// ���� �ִ� ������ �����Ǹ�
	if (fileName.trim() == "" && fileNameArray[selectFileIndex] != "") {
		alert("delete");
		fileSize--;
		fileNameArray[selectFileIndex] = "";
	} else {
		fileNameArray[selectFileIndex] = fileName;
	}
	
	//���ϻ����� 10�̸� ��ư ��Ȱ��ȭ
	if (fileSize >= 10) {
		$("#_fileBtn").attr("disabled", "disabled");
	} else {
		$("#_fileBtn").removeAttr("disabled");
	}
	
	drawFileNameDiv();
}

// ���� ���� ��ư Ŭ��
function delfile(i){
	var inputFileId = "#_fileList" + i;
	$(inputFileId).remove();
	fileNameArray[i] = "";
	fileSize--;
	$("#_fileBtn").removeAttr("disabled");
	
	var inputFileTagStr = "<input type='file' name='fileList[" + i +"]' id='_fileList"+ i +"' onchange='fileSelect("+ i +")' style='display:none;'>";
	$(inputFileTagStr).insertBefore($("#_fileNameDiv"));

	drawFileNameDiv();
}

// _fileNameDiv ����
function drawFileNameDiv() {
	var tagStr = "";
	for (var i = 0; i < 10; i++) {
		if (fileNameArray[i] != "") {
			tagStr += "<button type='button' onclick='delfile(" + i +")'>����</button>&nbsp;&nbsp;";
			tagStr += fileNameArray[i];
			tagStr += "<br>";
		}
		var fileNameInputId = "#_fileNameList" + i;
		$(fileNameInputId).val(fileNameArray[i]);
	}
	
	$("#_fileNameDiv").html(tagStr);
}

</script>