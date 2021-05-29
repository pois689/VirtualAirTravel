<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
//상세 보기 이동
function detailBtn(url) {
	document.detailForm.action=url;
	document.detailForm.submit();
}

</script>
<form method="get" action="/login/logout" name="detailForm">
<input type="hidden" name="id" value="${user.id}">
${msg}<br>
<button type="button" class="btn btn-default" onClick="detailBtn('/login/member_edit')">수정</button>
<button type=submit>로그아웃</button><br>
로그인 사용자 : ${user}
<br>
<%-- <%=session.getAttribute("user") %> --%>
${sessionScope.user }
<br>
</form>