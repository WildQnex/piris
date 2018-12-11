package by.bsuir.piris.controller;

import by.bsuir.piris.model.Client;
import by.bsuir.piris.repository.impl.ClientRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/api")
public class ClientController {
    @Autowired
    private ClientRepositoryImpl clientRepository;

    @GetMapping("/clients")
    public ModelAndView getClients() {
        ModelAndView modelAndView = new ModelAndView("clients");
        modelAndView.addObject("clients", clientRepository.getClients());
        return modelAndView;
    }

    @GetMapping("/clients/{id}")
    public ModelAndView getClient(@PathVariable long id) {
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("client", clientRepository.getClient(id));
        return modelAndView;
    }
}
