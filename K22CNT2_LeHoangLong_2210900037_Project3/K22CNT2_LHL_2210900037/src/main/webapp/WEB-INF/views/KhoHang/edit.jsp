<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chỉnh Sửa Kho Hàng</title>
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

        input[type="text"], input[type="number"], textarea, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
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
        <h2>Chỉnh Sửa Kho Hàng</h2>
        <!-- Form chỉnh sửa kho hàng -->
        <form action="${pageContext.request.contextPath}/KhoHang/editsave" method="post">
            <!-- Ẩn mã kho -->
            <input type="hidden" name="lhl_makho" value="${command.lhl_makho}"/>

            <!-- Các trường của kho hàng -->
            Tên Sản Phẩm: <select name="lhl_masp" required>
                <c:forEach var="sanPham" items="${sanPhams}">
                    <option value="${sanPham.lhl_masp}" ${command.lhl_masp == sanPham.lhl_masp ? 'selected' : ''}>
                        ${sanPham.lhl_tensp}
                    </option>
                </c:forEach>
            </select><br/>
            Số Lượng Tồn: <input type="number" name="lhl_soluongton" value="${command.lhl_soluongton}" required/><br/>
            Ngày Nhập: <input type="text" name="lhl_ngaynhap" value="${command.lhl_ngaynhap}" required/><br/>

            <input type="submit" value="Cập Nhật"/>
        </form>
        
        <br/>
        <!-- Liên kết quay lại danh sách kho hàng -->
        <a href="${pageContext.request.contextPath}/KhoHang/list">Quay lại danh sách</a>
    </div>
</body>
</html>
