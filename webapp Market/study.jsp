<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#side_left{
width:200px;
height:400px;
background-color:yellow;
float:left;
margin:5px;
}
#side_left_box{
width:95%;
height:45%;
background-color:blue;
float:left;
margin:5px;
}
#main{
width:400px;
height:400px;
background-color:green;
float:left;
margin:5px;
}
#side_main{
width:50px;
background-color:white;
float:left;
margin:5px;
}
#side_maina{
width:50px;
height:50px;
background-color:white;
float:left;
margin:5px;
}
#side_right{
width:200px;
height:400px;
background-color:red;
float:left;
margin:5px;
}
#side_rigth_box{
width:95%;
height:45%;
background-color:skyblue;
float:left;
margin:5px;
}
</style>
</head>
<body>
<div id="side_left">사이드바 왼쪽
	<div id="side_left_box">사이드바 왼쪽 위</div>
	<div id="side_left_box">사이드바 왼쪽 아래</div>
</div>

<div id="main">
	<div id="side_main">첫번째 공간</div>
	<div id="side_main">두번째 공간</div>
	<div id="side_main">세번째 공간</div>
</div>

<div id="side_right">사이드바 오른쪽
	<div id="side_rigth_box">사이드바 오른쪽 위</div>
	<div id="side_rigth_box">사이드바 오른쪽 아래</div>
</div>
</body>
</html>