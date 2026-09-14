package com.magasin.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.HashMap;
import java.util.Map;

public final class JPAUtil {
    private static EntityManagerFactory ENTITY_MANAGER_FACTORY;

    static {
        try {
            Map<String, String> configOverrides = new HashMap<>();

            String dbUrl = System.getenv("DB_URL");
            if (dbUrl == null || dbUrl.isBlank()) {
                dbUrl = System.getenv("DATABASE_URL");
            }
            String dbUser = System.getenv("DB_USER");
            if (dbUser == null || dbUser.isBlank()) {
                dbUser = System.getenv("DATABASE_USER");
            }
            String dbPassword = System.getenv("DB_PASSWORD");
            if (dbPassword == null || dbPassword.isBlank()) {
                dbPassword = System.getenv("DATABASE_PASSWORD");
            }

            if (dbUrl != null && !dbUrl.isBlank()) {
                configOverrides.put("javax.persistence.jdbc.url", dbUrl);
                if (dbUser != null && !dbUser.isBlank()) {
                    configOverrides.put("javax.persistence.jdbc.user", dbUser);
                }
                if (dbPassword != null) {
                    configOverrides.put("javax.persistence.jdbc.password", dbPassword);
                }
            }

            try {
                ENTITY_MANAGER_FACTORY = Persistence.createEntityManagerFactory("magasinPU", configOverrides);
                // Test connection
                EntityManager em = ENTITY_MANAGER_FACTORY.createEntityManager();
                em.close();
            } catch (Exception e) {
                System.err.println("Primary MySQL connection failed (" + e.getMessage() + "). Initializing embedded fallback database for Cloud.");
                Map<String, String> h2Overrides = new HashMap<>();
                h2Overrides.put("javax.persistence.jdbc.driver", "org.h2.Driver");
                h2Overrides.put("javax.persistence.jdbc.url", "jdbc:h2:mem:magasin_db;DB_CLOSE_DELAY=-1;MODE=MySQL;NON_KEYWORDS=USER,VALUE");
                h2Overrides.put("javax.persistence.jdbc.user", "sa");
                h2Overrides.put("javax.persistence.jdbc.password", "");
                h2Overrides.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
                h2Overrides.put("hibernate.hbm2ddl.auto", "update");

                ENTITY_MANAGER_FACTORY = Persistence.createEntityManagerFactory("magasinPU", h2Overrides);
            }
        } catch (Throwable t) {
            System.err.println("Fatal error initializing EntityManagerFactory: " + t.getMessage());
            t.printStackTrace();
        }
    }

    private JPAUtil() {
    }

    public static EntityManager getEntityManager() {
        return ENTITY_MANAGER_FACTORY.createEntityManager();
    }

    public static void shutdown() {
        if (ENTITY_MANAGER_FACTORY != null && ENTITY_MANAGER_FACTORY.isOpen()) {
            ENTITY_MANAGER_FACTORY.close();
        }
    }
}
