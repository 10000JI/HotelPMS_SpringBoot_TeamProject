package com.dev.pms.user;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.xmlbeans.impl.xb.xsdschema.Attribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
@Controller
@RequestMapping("/user/*")
public class UserController {
    @Autowired
    private UserService userService;
    @GetMapping("userList")
    public ModelAndView getUserList(UserVO userVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String id = authentication.getName();
        List<UserVO> userVOS = userService.getUserList(userVO);
        UserDetails userInfo = userService.loadUserByUsername("id");
        mv.addObject("userInfo",userInfo);
        mv.addObject("userVO",userVOS);
        mv.setViewName("user/userList");
        return mv;
    }

    @GetMapping("/download")
    public void excelDownload(HttpServletResponse response,UserVO userVO) throws Exception {
        List<UserVO> userVOS = userService.getUserList(userVO);
        //        Workbook wb = new HSSFWorkbook();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("번호");
        cell = row.createCell(1);
        cell.setCellValue("이름");
        cell = row.createCell(2);
        cell.setCellValue("아이디");
        cell = row.createCell(3);
        cell.setCellValue("이메일");
        cell = row.createCell(4);
        cell.setCellValue("권한");
        cell = row.createCell(5);
        cell.setCellValue("전화번호");

        // Body
        for (int i=0; i<userVOS.size(); i++) {
            UserVO user = userVOS.get(i);
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(i);
            cell = row.createCell(1);
            cell.setCellValue(user.getName());
            cell = row.createCell(2);
            cell.setCellValue(user.getId());
            cell = row.createCell(3);
            cell.setCellValue(user.getEmail());
            cell = row.createCell(4);
            cell.setCellValue(user.getRoleName());
            cell = row.createCell(5);
            cell.setCellValue(user.getPhoneNumber());
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
      //  response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=UserList.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
    @GetMapping("userLogin")
    public ModelAndView getLogin(HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView();
        Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
        //로그인 후 뒤로가기 했을때, 다시 로그인 화면 나타나는 것을 방지
        if(obj==null) {
            mv.setViewName("/user/userLogin");
        }else {
            mv.setViewName("/");
        }
        return mv;
    }


}

