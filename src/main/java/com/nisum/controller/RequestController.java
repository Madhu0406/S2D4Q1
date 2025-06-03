package com.nisum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.Map;

@Controller
public class RequestController {

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/greet")
    @ResponseBody
    public String greet(@RequestParam String name) {
        return "Hello, " + name;
    }

    @GetMapping("/json/{id}")
    @ResponseBody
    public Map<String, Object> getJson(@PathVariable int id) {
        Map<String, Object> response = new HashMap<>();
        response.put("id", id);
        response.put("status", "success");
        return response;
    }

    @PostMapping("/submit")
    @ResponseBody
    public String postData(@RequestParam String data) {
        return "Received: " + data;
    }

    @GetMapping("/view")
    public String viewExample(Model model) {
        model.addAttribute("message", "This is the JSP view.");
        return "home";
    }
}
