package com.boots.controller;

import com.boots.WebMvcConfig;
import com.boots.entity.User;
import com.boots.service.ProductService;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import javax.validation.Valid;
import java.util.Locale;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @GetMapping("/admin")
    public String userList(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("allUsers", userService.allUsers());
        return "admin";
    }
//    @GetMapping("/admin?err")
//    public String userListErr(Model model) {
//        model.addAttribute("user", new User());
//        model.addAttribute("allUsers", userService.allUsers());
//        model.addAttribute("err", "err1");
//        return "admin";
//    }
    @PostMapping("/admin")
    public String deleteUser(@RequestParam(required = true, defaultValue = "") Long userId, @RequestParam(required = true, defaultValue = "")
            String action, @ModelAttribute("user") @Valid User userForm, BindingResult bindingResult, Model model) {

        if (action.equals("delete")) {
            userService.deleteUser(userId);

        }
        else if (!action.equals("delete")) {
            if (userId!=null){
            userService.deleteUser(userId);}

            if (bindingResult.hasErrors()) {
                return "/admin";
            }
            if (!userForm.getPassword().equals(userForm.getPasswordConfirm())){
                model.addAttribute("passwordError", "Пароли не совпадают");
                return "/admin";
            }
            if (!userService.saveUser(userForm)){
                model.addAttribute("usernameError", "Пользователь с таким именем уже существует");
                return "/admin";
            }
        }
        return "redirect:/admin";
    }

//    @GetMapping("/admin/gt/{userId}")
//    public String gtUser(@PathVariable("userId") Long userId, Model model) {
//        model.addAttribute("allUsers", userService.usergtList(userId));
//        return "admin";
//    }
}
