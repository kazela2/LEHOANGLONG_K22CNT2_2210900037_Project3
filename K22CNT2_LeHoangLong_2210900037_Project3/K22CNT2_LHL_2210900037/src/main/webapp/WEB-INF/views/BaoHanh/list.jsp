<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Danh Sách Bảo Hành</title>
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
    <h1>Danh Sách Bảo Hành</h1>
    <table border="1">
        <tr>
            <th>Tên Sản Phẩm</th>
            <th>Ngày Bắt Đầu</th>
            <th>Ngày Kết Thúc</th>
            <th>Trạng Thái</th>
            <th>Chỉnh Sửa</th>
            <th>Xóa</th>
        </tr>
        <c:forEach var="bh" items="${list}">
            <tr>
                <td><c:forEach var="sanPham" items="${sanPhams}">
                        <c:if test="${sanPham.lhl_masp == bh.lhl_masp}">
                            ${sanPham.lhl_tensp}
                        </c:if>
                    </c:forEach></td>
                <td><fmt:formatDate value="${bh.lhl_ngaybatdau}"
                        pattern="yyyy/MM/dd" /></td>
                <td><fmt:formatDate value="${bh.lhl_ngayketthuc}"
                        pattern="yyyy/MM/dd" /></td>
                <td>${bh.lhl_trangthai}</td>
                <td><a
                    href="${pageContext.request.contextPath}/BaoHanh/edit/${bh.lhl_mabaohanh}">Chỉnh Sửa</a></td>
                <td><a
                    href="${pageContext.request.contextPath}/BaoHanh/delete/${bh.lhl_mabaohanh}"
                    onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a></td>
            </tr>
        </c:forEach>
    </table>
    <br />

    <a href="${pageContext.request.contextPath}/menu">Quay Lại</a>

    <a href="${pageContext.request.contextPath}/BaoHanh/add">Thêm Mới</a>
</body>
</html>
