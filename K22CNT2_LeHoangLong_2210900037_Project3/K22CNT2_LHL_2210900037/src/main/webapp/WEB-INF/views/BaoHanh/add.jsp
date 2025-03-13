<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm Bảo Hành</title>
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

        input[type="text"], input[type="email"], input[type="tel"], select, input[type="date"] {
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
    <script>
        // Hàm chuyển đổi định dạng ngày từ yyyy-mm-dd thành yyyy/mm/dd
        function convertDateFormat(input) {
            var date = input.value;
            if (date) {
                // Kiểm tra xem định dạng có phải yyyy-mm-dd không
                var parts = date.split('-');
                if (parts.length === 3) {
                    // Chuyển sang yyyy/mm/dd
                    input.value = parts.join('/');
                }
            }
        }

        // Khi người dùng nhập vào các trường ngày, tự động chuyển đổi định dạng
        window.onload = function() {
            var ngayBatDauInput = document.getElementById('ngaybatdau');
            var ngayKetThucInput = document.getElementById('ngayketthuc');
            
            ngayBatDauInput.addEventListener('blur', function() {
                convertDateFormat(ngayBatDauInput);
            });
            ngayKetThucInput.addEventListener('blur', function() {
                convertDateFormat(ngayKetThucInput);
            });
        };
    </script>
</head>
<body>
    <div>
        <h2>Thêm Bảo Hành</h2>
        <!-- Form để thêm bảo hành -->
        <form action="${pageContext.request.contextPath}/BaoHanh/save" method="post">
            <!-- Mã Sản Phẩm -->
            Tên Sản Phẩm:
            <select name="lhl_masp" required>
                <option value="" disabled selected>Chọn Sản Phẩm</option>
                <c:forEach var="sanPham" items="${sanPhams}">
                    <option value="${sanPham.lhl_masp}">${sanPham.lhl_tensp}</option>
                </c:forEach>
            </select><br/>

            Ngày Bắt Đầu:
            <input type="text" name="lhl_ngaybatdau" value="${command.lhl_ngaybatdau}" required /><br />

            Ngày Kết Thúc:
            <input type="text" name="lhl_ngayketthuc" value="${command.lhl_ngayketthuc}" required /><br />

            Trạng Thái:
            <select name="lhl_trangthai" required>
                <option value="Bảo Hành">Bảo Hành</option>
                <option value="Hết Hạn">Hết Hạn Bảo Hành</option>
            </select><br />
            <input type="submit" value="Lưu" />
        </form>

        <br />
        <!-- Quay lại danh sách bảo hành -->
        <a href="${pageContext.request.contextPath}/BaoHanh/list">Quay lại danh sách</a>
    </div>
</body>
</html>
