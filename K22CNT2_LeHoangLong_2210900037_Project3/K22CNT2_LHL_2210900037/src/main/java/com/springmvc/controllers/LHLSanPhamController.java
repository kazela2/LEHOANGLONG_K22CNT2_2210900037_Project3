	package com.springmvc.controllers;
	
	import java.util.List;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.PathVariable;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.beans.LHLDanhGia;
import com.springmvc.beans.LHLKhachHang;
import com.springmvc.beans.LHLSanPham;
import com.springmvc.dao.LHLDanhGiaDao;
import com.springmvc.dao.LHLKhachHangDao;
import com.springmvc.dao.LHLSanPhamDao;
	
	@Controller
	public class LHLSanPhamController {
	
	    @Autowired
	    LHLSanPhamDao dao;
	    
	    @Autowired
	    LHLDanhGiaDao danhGiadao;
	    
	    @Autowired
	    LHLKhachHangDao khachHangDao;
	
	    // Hiển thị danh sách sản phẩm (đã sửa URL)
	    @RequestMapping("/SanPham/list")
	    public String viewSanPhamList(Model m) {
	        List<LHLSanPham> list = dao.getAllSanPham();
	        m.addAttribute("list", list);
	        return "SanPham/list";
	    }
	
	    // Form thêm sản phẩm
	    @RequestMapping("/SanPham/add")
	    public String showAddForm(Model m) {
	        m.addAttribute("command", new LHLSanPham());
	        return "SanPham/add"; // Trả về view sanpham/add.jsp
	    }
	
	    // Lưu sản phẩm mới
	    @RequestMapping(value = "/SanPham/save", method = RequestMethod.POST)
	    public String save(@ModelAttribute("sp") LHLSanPham sp) {
	        dao.save(sp);
	        return "redirect:/SanPham/list"; // Redirect đến danh sách sản phẩm
	    }
	
	    // Form chỉnh sửa sản phẩm
	    @RequestMapping("/SanPham/edit/{id}")
	    public String edit(@PathVariable int id, Model m) {
	        LHLSanPham sp = dao.getSanPhamById(id);
	        m.addAttribute("command", sp);
	        return "SanPham/edit"; // Trả về view sanpham/edit.jsp
	    }
	
	    // Lưu chỉnh sửa
	    @RequestMapping(value = "/SanPham/editsave", method = RequestMethod.POST)
	    public String editsave(@ModelAttribute("sp") LHLSanPham sp) {
	        dao.update(sp);
	        return "redirect:/SanPham/list"; // Redirect đến danh sách sản phẩm
	    }
	
	    // Xóa sản phẩm
	    @RequestMapping("/SanPham/delete/{id}")
	    public String delete(@PathVariable int id) {
	        dao.delete(id);
	        return "redirect:/SanPham/list"; // Redirect đến danh sách sản phẩm
	    }
	
	    // Ánh xạ đến trang menu
	    @RequestMapping("/menu")
	    public String showMenu() {
	        return "menu"; 
	    }
	    @RequestMapping("/gioithieu")
	    public String showGioiThieu() {
	        return "gioithieu"; // Trả về view gioithieu.jsp
	    }
	    
	    @RequestMapping("/dichvu")
	    public String showDichVu(Model model) {
	        // Lấy danh sách sản phẩm
	        List<LHLSanPham> sanPhamList = dao.getAllSanPham();
	        // Lấy danh sách đánh giá
	        List<LHLDanhGia> danhgia = danhGiadao.getAllDanhGia();
	        // Lấy danh sách khách hàng
	        List<LHLKhachHang> khachHangs = khachHangDao.getAllKhachHang();

	        // Gửi dữ liệu sản phẩm, đánh giá, khách hàng đến JSP
	        model.addAttribute("sanPhamList", sanPhamList);
	        model.addAttribute("danhgia", danhgia);
	        model.addAttribute("khachHangs", khachHangs);
	        
	        return "dichvu"; // Trả về view dichvu.jsp
	    }

	   
	 
}
	
