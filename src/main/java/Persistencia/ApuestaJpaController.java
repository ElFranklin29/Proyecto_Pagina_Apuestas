package Persistencia;

import Logica.Apuesta;
import Persistencia.exceptions.NonexistentEntityException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;

public class ApuestaJpaController implements Serializable {

    public ApuestaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public ApuestaJpaController() {
        emf = Persistence.createEntityManagerFactory("SitioApuestasPU");
    }

    public void create(Apuesta apuesta) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(apuesta);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Apuesta apuesta) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            apuesta = em.merge(apuesta);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = apuesta.getId_apuesta();
                if (findApuesta(id) == null) {
                    throw new NonexistentEntityException("The apuesta with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Apuesta apuesta;
            try {
                apuesta = em.getReference(Apuesta.class, id);
                apuesta.getId_apuesta();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The apuesta with id " + id + " no longer exists.", enfe);
            }
            em.remove(apuesta);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Apuesta> findApuestaEntities() {
        return findApuestaEntities(true, -1, -1);
    }

    public List<Apuesta> findApuestaEntities(int maxResults, int firstResult) {
        return findApuestaEntities(false, maxResults, firstResult);
    }

    private List<Apuesta> findApuestaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Apuesta.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Apuesta findApuesta(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Apuesta.class, id);
        } finally {
            em.close();
        }
    }

    public int getApuestaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Apuesta> rt = cq.from(Apuesta.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
    
    public List<Apuesta> findApuestasByIdCliente(int id_cliente) {
    EntityManager em = getEntityManager();
    try {
        
        String sql = "SELECT * FROM apuesta WHERE id_cliente = ?";
        Query query = em.createNativeQuery(sql, Apuesta.class);
        query.setParameter(1, id_cliente);

        return query.getResultList();
    } finally {
        em.close();
    }
}

}
