<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Danh Sách Nhân Viên</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color: white;
}

h1 {
	text-align: center;
	color: #333;
}

table {
	border-collapse: collapse;
	margin: 20px 0;
	width: 70%;
	background-color: white;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

th, td {
	border: 2px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #007BFF;
	color: white;
}

a {
	text-decoration: none;
	color: #007BFF;
	margin: 10px;
	display: inline-block;
	padding: 8px 12px;
	border: 1px solid #007BFF;
	border-radius: 5px;
	transition: 0.3s;
}

a:hover {
	background-color: #007BFF;
	color: white;
}
</style>
</head>
<body>
	<h1>Danh Sách Nhân Viên</h1>
	<table border="1">
		<tr>
			<th>Họ Tên</th>
			<th>Số Điện Thoại</th>
			<th>Chức Vụ</th>
			<th>Chỉnh Sửa</th>
			<th>Xóa</th>
		</tr>
		<c:forEach var="nv" items="${list}">
			<tr>
				<td>${nv.lhl_hoten}</td>
				<td>${nv.lhl_sodienthoai}</td>
				<td>${nv.lhl_chucvu}</td>
				<!-- Sửa lại link edit và delete -->
				<td><a
					href="${pageContext.request.contextPath}/NhanVien/edit/${nv.lhl_manv}">Sửa</a></td>
				<td><a
					href="${pageContext.request.contextPath}/NhanVien/delete/${nv.lhl_manv}"
					onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<!-- Sửa lại đường dẫn quay lại -->
	<a href="${pageContext.request.contextPath}/menu">Quay Lại</a>
	<!-- Sửa lại đường dẫn thêm mới nhân viên -->
	<a href="${pageContext.request.contextPath}/NhanVien/add">Thêm Mới
		Nhân Viên</a>
</body>
</html>
