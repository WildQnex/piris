package by.bsuir.piris.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

import javax.validation.Valid;

import by.bsuir.piris.model.Client;

@Controller
public class WebController {

    //@Value("${welcome.message:test}")
    //private String message = "Hello World";

    @PostMapping("/add")
    public ModelAndView add(@Valid @ModelAttribute("client") Client client) {
        System.out.println(client);
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("client", client);
        return modelAndView;
    }

}
