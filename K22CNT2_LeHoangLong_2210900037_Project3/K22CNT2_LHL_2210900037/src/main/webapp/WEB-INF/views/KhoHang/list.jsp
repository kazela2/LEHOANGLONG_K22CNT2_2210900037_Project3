<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Kho Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            font-size: 30px;
            margin-top: 20px;
            color: #333;
        }
        
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            margin-top: 20px;
        }

        .product-card {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: center;
            border-radius: 5px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            width: 300px;
            transition: transform 0.3s ease-in-out;
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        .product-card h3 {
            font-size: 20px;
            margin: 10px 0;
            color: #2c3e50;
        }

        .price {
            color: red;
            font-size: 18px;
            font-weight: bold;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        .btn-edit {
            background-color: #f39c12;
            color: white;
            border: 1px solid #f39c12;
        }

        .btn-edit:hover {
            background-color: #e67e22;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
            border: 1px solid #e74c3c;
        }

        .btn-delete:hover {
            background-color: #c0392b;
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
    </style>
</head>
<body>
    <h1>Danh Sách Kho Hàng</h1>
    <div class="product-container">
        <c:forEach var="khang" items="${list}">
            <div class="product-card">
                <h3> 
                    <c:forEach var="sanPham" items="${sanPhams}">
                        <c:if test="${sanPham.lhl_masp == khang.lhl_masp}">
                            ${sanPham.lhl_tensp}
                        </c:if>
                    </c:forEach>
                </h3>
                <p><strong>Số Lượng Tồn:</strong> ${khang.lhl_soluongton}</p>
                <p><strong>Ngày Nhập:</strong> ${khang.lhl_ngaynhap}</p>
                <a href="${pageContext.request.contextPath}/KhoHang/edit/${khang.lhl_makho}" class="btn btn-edit">Edit</a>
                <a href="${pageContext.request.contextPath}/KhoHang/delete/${khang.lhl_makho}" class="btn btn-delete" onclick="return confirm('Bạn có chắc muốn xóa không?')">Delete</a>
            </div>
        </c:forEach>
    </div>
    <a href="${pageContext.request.contextPath}/menu" class="btn">Quay lại</a>
    <a href="${pageContext.request.contextPath}/KhoHang/add" class="btn">Thêm Mới</a>
</body>
</html>
