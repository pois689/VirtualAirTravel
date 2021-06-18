<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Places Search Box</title>
<link rel="stylesheet" href="/resources/css/map/map.css">
</head>
<body>
<div id="container">
	<div id="sidebar">
		<ul id="places"></ul>
		<button id="more">Load more results</button>
	</div>
	<div id="map"></div>
</div>
</body>
<script type="text/javascript">
	let name = "<c:out value='${name}'/>" || "도쿄역";
	console.log(name);
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?
	key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo
	&region=JP
	&language=ko
	&callback=initAutocomplete
	&libraries=places
	&v=weekly"
	async
></script>
<script src="/resources/js/map/mapConstant.js"></script>
<script src="/resources/js/map/map.js"></script>
<script src="/resources/js/map/mapFunction.js"></script>
</html>