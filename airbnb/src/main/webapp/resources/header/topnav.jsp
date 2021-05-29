<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HowToCreate Series | Menu | Top Navigation</title>
<style>
		/* Add a black background color to the top navigation */
		.topnav {
			background-color: #333;
			overflow: hidden;
		}

		/* Style the links inside the navigation bar */
		.topnav a {
			float: left;
			color: #f2f2f2;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
			font: 400 18px Lato, sans-serif;
		}

		/* Change the color of links on hover */
		.topnav a:hover {
			background-color: #ddd;
			color: black;
		}

		/* Add a color to the active/current link */
		.topnav a.active {
			background-color: #61977e;
			color: white;
		}

		/* Style logo */
		.logo{
			height: 18px;
		}
	</style>
</head>
<body>
	<nav class="topnav">
		<a class="active" href="/login/login">Home</a>
		<a href="">News</a>
		<a href="#contact">Contact</a>
		<a href="#about">About</a>
	</nav>
</body>
</html>