<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

	<h1>Danh Sách Khách Hàng</h1>
	<table border="1">
		<tr>
			<th>Tên Khách Hàng</th>
			<th>Email</th>
			<th>Số Điện Thoại</th>
			<th>Sửa</th>
			<th>Xóa</th>
		</tr>
		<c:forEach var="khachhang" items="${listkh}">
			<tr>
				<td>${khachhang.lhl_hoten}</td>
				<td>${khachhang.lhl_email}</td>
				<td>${khachhang.lhl_sodienthoai}</td>
				<td><a
					href="${pageContext.request.contextPath}/KhachHang/edit/${khachhang.lhl_makh}">Sửa</a>
				</td>
				<td><a
					href="${pageContext.request.contextPath}/KhachHang/delete/${khachhang.lhl_makh}">Xóa</a>
				</td>
			</tr>
		</c:forEach>

	</table>
	<br />
	<!-- Sửa lại đường dẫn quay lại -->
	<a href="${pageContext.request.contextPath}/menu">Quay Lại</a>
	<!-- Sửa lại đường dẫn thêm mới khách hàng -->
	<a href="${pageContext.request.contextPath}/KhachHang/add">Thêm Mới</a>

</body>
</html>