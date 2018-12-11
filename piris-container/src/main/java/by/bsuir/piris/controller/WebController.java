package by.bsuir.piris.controller;

import by.bsuir.piris.model.Client;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class WebController {

    @PostMapping("/add")
    public ModelAndView add(@Valid @ModelAttribute("client") Client client ) {
        System.out.println(client);
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("client", client);
        return modelAndView;
    }

}
