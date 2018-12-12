package by.bsuir.piris.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.bsuir.piris.model.Client;
import by.bsuir.piris.model.ClientDto;
import by.bsuir.piris.repository.impl.ClientRepositoryImpl;

@Controller
@RequestMapping("/api/clients")
public class ClientController
{
    @Autowired
    private ClientRepositoryImpl clientRepository;

    @GetMapping
    public ModelAndView getClients()
    {
        ModelAndView modelAndView = new ModelAndView("clients");
        modelAndView.addObject("clients", clientRepository.getClients());
        return modelAndView;
    }

    @GetMapping("/{id}")
    public ModelAndView getClient(@PathVariable long id)
    {
        ModelAndView modelAndView = new ModelAndView("client");
        modelAndView.addObject("client", clientRepository.getClient(id));
        return modelAndView;
    }

    @PostMapping("")
    public ModelAndView update(@ModelAttribute ClientDto client)
    {
        clientRepository.update(new Client(client));
        return getClients();
    }

    @PostMapping("/add")
    public ModelAndView create(@ModelAttribute ClientDto client)
    {
        client.setId(0);
        clientRepository.create(new Client(client));
        return getClients();
    }

    @GetMapping("/add")
    public ModelAndView create()
    {
        ModelAndView modelAndView = new ModelAndView("add");
        modelAndView.addObject("client", new Client());
        return modelAndView;
    }

    @GetMapping("/delete")
    public ModelAndView delete(@RequestParam long id)
    {
        clientRepository.delete(id);
        return getClients();
    }
}
