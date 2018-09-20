package by.bsuir.piris.repository.impl;

import by.bsuir.piris.model.Client;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public class ClientRepositoryImpl {

    @PersistenceContext
    EntityManager entityManager;

    @Transactional
    public List<Client> getClients(){
        CriteriaQuery<Client> query = entityManager.getCriteriaBuilder().createQuery(Client.class);
        Root<Client> clientRoot = query.from(Client.class);
        query.where(entityManager.getCriteriaBuilder().notEqual(clientRoot.get("id"), 0));
        return entityManager.createQuery(query).getResultList();
    }
}
