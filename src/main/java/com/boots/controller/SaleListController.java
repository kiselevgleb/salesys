package com.boots.controller;

import com.boots.entity.Product;
import com.boots.service.ProductService;
import com.fasterxml.jackson.annotation.JsonView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
public class SaleListController {
    private final Logger log = LoggerFactory.getLogger(getClass());
    @Autowired
    private ProductService productService;

    @GetMapping("/list")
    public String productList(
            @RequestParam @Nullable String startDate,
            @RequestParam @Nullable String startTime,
            @RequestParam @Nullable String endDate,
            @RequestParam @Nullable String endTime, Model model) throws ParseException {
        SimpleDateFormat  format = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ENGLISH);
//        while (startDate==null||startDate==""||startTime==null||startTime==""||endDate==null||endDate==""||endTime==null||endTime==""||){
//            switch ("null"){
//                case startDate: startDate="1970-01-01";
//                case startTime: startTime="00:00:00";
//                case endDate: endDate="1970-01-01";
//                case endTime: endTime="00:00:00";
//            }
//        }
        if(startDate!=null&&startDate!=""){
            model.addAttribute("allProduct", productService.filteredProduct(format.parse(startDate+" "+ startTime), format.parse(endDate+" "+ endTime)));
        }
        else {model.addAttribute("allProduct", productService.allProduct());}
        return "list";
    }

}
