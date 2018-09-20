package by.bsuir.piris.controller;

import by.bsuir.piris.model.Client;
import by.bsuir.piris.repository.impl.ClientRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/countries")
public class ClientController {
    @Autowired
    private ClientRepositoryImpl clientRepository;

    @GetMapping
    @ResponseBody
    public List<Client> getClients() {
        return clientRepository.getClients();
    }
}
