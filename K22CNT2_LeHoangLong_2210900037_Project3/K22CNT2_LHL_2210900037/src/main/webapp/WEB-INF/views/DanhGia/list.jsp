<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Đánh Giá</title>
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
    <h1>Đánh Giá</h1>
    <table border="1">
        <tr>
            <th>Tên Sản Phẩm</th>
            <th>Tên Khách Hàng</th>
            <th>Đánh Giá</th>
            <th>Nhận Xét</th>
            <th>Chỉnh Sửa</th>
            <th>Xóa</th>
        </tr>
        <c:forEach var="dg" items="${list}">
            <tr>
                <td>
                <c:forEach var="sanPham" items="${sanPhams}">
                        <c:if test="${sanPham.lhl_masp == dg.lhl_masp}">
                            ${sanPham.lhl_tensp}
                        </c:if>
                    </c:forEach>
                </td>
                <td><c:forEach var="khachHang" items="${khachHangs}">
                        <c:if test="${khachHang.lhl_makh == dg.lhl_makh}">
                            ${khachHang.lhl_hoten}
                        </c:if>
                    </c:forEach></td>

                <td>${dg.lhl_danhgia}</td>
                <td>${dg.lhl_nhanxet}</td>
                <td><a
                    href="${pageContext.request.contextPath}/DanhGia/edit/${dg.lhl_madanhgia}">Chỉnh Sửa</a></td>
                <td><a
                    href="${pageContext.request.contextPath}/DanhGia/delete/${dg.lhl_madanhgia}"
                    onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a></td>
            </tr>
        </c:forEach>
    </table>
    <br />

    <a href="${pageContext.request.contextPath}/menu">Quay Lại</a>

    <a href="${pageContext.request.contextPath}/DanhGia/add">Thêm Mới</a>
</body>
</html>
