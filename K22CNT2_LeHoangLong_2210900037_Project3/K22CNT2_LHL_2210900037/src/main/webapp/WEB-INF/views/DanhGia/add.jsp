<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Thêm Đánh Giá</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

h2 {
	text-align: center;
	color: #333;
}

form {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 400px;
}

input[type="text"], input[type="email"], input[type="tel"], select,
	input[type="date"] {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

select {
	background-color: #fff;
	color: #333;
	font-size: 16px;
	cursor: pointer;
}

input[type="submit"] {
	background-color: #007BFF;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

a {
	text-decoration: none;
	color: #007BFF;
	display: inline-block;
	margin-top: 15px;
	text-align: center;
}

a:hover {
	color: #0056b3;
}
</style>
</head>
<body>
	<div>
		<h2>Thêm Đánh Giá</h2>

		<form action="${pageContext.request.contextPath}/DanhGia/save"
			method="post">
			<!-- Mã Sản Phẩm -->
			Tên Sản Phẩm: <select name="lhl_masp" required>
				<option value="" disabled selected>Chọn Sản Phẩm</option>
				<c:forEach var="sanPham" items="${sanPhams}">
					<option value="${sanPham.lhl_masp}">${sanPham.lhl_tensp}</option>
				</c:forEach>
			</select><br /> 
			
			Tên Khách Hàng: 
			<select name="lhl_makh" required>
				<option value="" disabled selected>Chọn Khách Hàng</option>
				<c:forEach var="khachHang" items="${khachHangs}">
					<option value="${khachHang.lhl_makh}">${khachHang.lhl_hoten}</option>
				</c:forEach>
			</select> 
			
			Đánh Giá: <select name="lhl_danhgia" required>
				<option value="1">1 Sao</option>
				<option value="2">2 Sao</option>
				<option value="3">3 Sao</option>
				<option value="4">4 Sao</option>
				<option value="5">5 Sao</option>
			</select><br /> 
			Nhận Xét: <input type="text" name="lhl_nhanxet"
				value="${command.lhl_nhanxet}" required /><br /> 
				
				<input type="submit" value="Lưu" />
		</form>

		<br />
		<!-- Quay lại danh sách bảo hành -->
		<a href="${pageContext.request.contextPath}/DanhGia/list">Quay lại
			danh sách</a>
	</div>
</body>
</html>
