package com.magasin.util;

import com.magasin.model.entity.Category;
import com.magasin.model.entity.Product;
import com.magasin.model.entity.Supplier;
import com.magasin.model.entity.User;
import com.magasin.model.enums.Role;
import com.magasin.repository.CategoryRepository;
import com.magasin.repository.ProductRepository;
import com.magasin.repository.SupplierRepository;
import com.magasin.repository.UserRepository;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@WebListener
public class AppInitializer implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        UserRepository userRepository = new UserRepository();
        if (userRepository.findByUsername("admin") == null) {
            User user = new User();
            user.setUsername("admin");
            user.setFullname("Administrateur");
            user.setRole(Role.ADMIN);
            user.setPassword(PasswordUtil.hash("admin123"));
            userRepository.save(user);
        }

        seedDefaultProducts();
    }

    private void seedDefaultProducts() {
        CategoryRepository catRepo = new CategoryRepository();
        SupplierRepository suppRepo = new SupplierRepository();
        ProductRepository prodRepo = new ProductRepository();

        try {
            // Seed Supplier if missing
            Supplier defaultSupplier = null;
            var suppliers = suppRepo.findAll();
            if (suppliers.isEmpty()) {
                defaultSupplier = new Supplier();
                defaultSupplier.setName("Tech Master Supplier");
                defaultSupplier.setEmail("contact@techmasters.ma");
                defaultSupplier.setPhone("+212 522 00 11 22");
                defaultSupplier.setAddress("Casablanca, Maroc");
                suppRepo.save(defaultSupplier);
            } else {
                defaultSupplier = suppliers.get(0);
            }

            // Seed Categories if missing
            String[] catNames = {"Smartphones", "Laptops", "PC Gamer", "Audio", "Accessoires", "Imprimantes", "Réseau", "Logiciels", "Tablets", "Appareils Photo"};
            Map<String, Category> catMap = new HashMap<>();

            for (Category c : catRepo.findAll()) {
                catMap.put(c.getName(), c);
            }

            for (String catName : catNames) {
                if (!catMap.containsKey(catName)) {
                    Category cat = new Category();
                    cat.setName(catName);
                    cat.setDescription("Catégorie " + catName);
                    catRepo.save(cat);
                    catMap.put(catName, cat);
                }
            }

            // Seed branded products if missing
            Object[][] seedData = {
                {"Sony PlayStation 5 Slim 1TB", "SONY-PS5-01", "Console de jeux de dernière génération avec retour haptique et graphismes 4K Ultra HD.", "https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=600&auto=format&fit=crop&q=80", "4500.00", "5499.00", 15, 3, "PC Gamer"},
                {"Sony Headphones WH-1000XM5", "SONY-XM5-02", "Casque audio à réduction de bruit active leader du marché avec autonomie 30h.", "https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=600&auto=format&fit=crop&q=80", "2800.00", "3499.00", 20, 4, "Audio"},
                {"Apple iPhone 15 Pro Max 256GB Titanium", "APPL-IP15-01", "Smartphone Apple avec puce A17 Pro, design en titane et capteur 48MP.", "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600&auto=format&fit=crop&q=80", "12500.00", "14999.00", 10, 2, "Smartphones"},
                {"Apple MacBook Pro 14 M3 16GB", "APPL-MBP14-02", "Ordinateur portable professionnel Apple avec écran Liquid Retina XDR et puce M3.", "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&auto=format&fit=crop&q=80", "18500.00", "21999.00", 8, 2, "Laptops"},
                {"Lenovo Legion 5 Pro RTX 4070", "LENV-LEG5-01", "PC Gamer portable Lenovo avec écran 16 pouces 240Hz, Core i7 et 32GB RAM.", "https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80", "13500.00", "16499.00", 12, 3, "PC Gamer"},
                {"Lenovo ThinkPad X1 Carbon Gen 11", "LENV-X1C-02", "Ultrabook d'entreprise Lenovo ultra-léger en fibre de carbone avec sécurité avancée.", "https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80", "15000.00", "18999.00", 6, 2, "Laptops"},
                {"HP Spectre x360 Convertible OLED", "HPPV-SPC-01", "PC hybride 2-en-1 HP haut de gamme avec écran tactile OLED et stylet inclus.", "https://images.unsplash.com/photo-1544731612-de7f96afe55f?w=600&auto=format&fit=crop&q=80", "11500.00", "13999.00", 9, 2, "Laptops"},
                {"HP Pavilion Gaming Desktop RTX 3060", "HPPV-PAV-02", "Unité centrale HP Gaming optimisée pour l'esport et la création multimédia.", "https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=600&auto=format&fit=crop&q=80", "8500.00", "10999.00", 7, 2, "PC Gamer"},
                {"Dell XPS 15 OLED Touch 32GB", "DELL-XPS15-01", "Ordinateur Dell création de contenu avec écran 3.5K OLED, Core i9 et RTX 4060.", "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=600&auto=format&fit=crop&q=80", "19000.00", "22999.00", 5, 1, "Laptops"},
                {"Dell Gaming G15 Laptop Core i7", "DELL-G15-02", "PC Gamer portable Dell robuste avec refroidissement Alienware-inspired.", "https://images.unsplash.com/photo-1593642702821-c8da6771f0c6?w=600&auto=format&fit=crop&q=80", "9200.00", "11499.00", 14, 4, "PC Gamer"},
                {"Asus ROG Strix Scar 16 RTX 4090", "ASUS-ROG16-01", "Monstre de puissance Asus ROG avec écran QHD+ 240Hz, Core i9-13980HX et 64GB.", "https://images.unsplash.com/photo-1618424181497-157f25b6ddd5?w=600&auto=format&fit=crop&q=80", "23000.00", "27999.00", 4, 1, "PC Gamer"},
                {"Asus ZenBook Duo 14 Dual Screen", "ASUS-ZNB-02", "Laptop Asus révolutionnaire à double écran tactile pour le multitâche professionnel.", "https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=600&auto=format&fit=crop&q=80", "14200.00", "17499.00", 6, 2, "Laptops"},
                {"Microsoft Surface Pro 9 i7 16GB", "MSFT-SURF9-01", "Tablette convertible Microsoft professionnelle avec clavier Type Cover et Slim Pen 2.", "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=600&auto=format&fit=crop&q=80", "12000.00", "14999.00", 8, 2, "Tablets"},
                {"Logitech MX Master 3S Performance Mouse", "LOGI-MX3S-01", "Souris ergonomique sans fil Logitech haute précision avec molette MagSpeed.", "https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?w=600&auto=format&fit=crop&q=80", "890.00", "1199.00", 35, 5, "Accessoires"},
                {"Logitech G PRO X Wireless Headset", "LOGI-GPRO-02", "Casque gaming professionnel Logitech avec technologie sans fil LIGHTSPEED et Blue VO!CE.", "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=600&auto=format&fit=crop&q=80", "1450.00", "1899.00", 22, 5, "Audio"},
                {"MSI Katana 15 B13V RTX 4060", "MSI-KAT15-01", "Laptop Gamer MSI puissant équipé d'un écran 144Hz et du clavier rétroéclairé 4 zones RGB.", "https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80", "11200.00", "13999.00", 11, 3, "PC Gamer"},
                {"Huawei MatePad Pro 11 OLED", "HWAI-MTP11-01", "Tablette haute définition Huawei avec écran 120Hz, M-Pencil et 8 haut-parleurs.", "https://images.unsplash.com/photo-1561154464-82e9adf32764?w=600&auto=format&fit=crop&q=80", "5100.00", "6499.00", 10, 3, "Tablets"},
                {"Epson EcoTank L3250 Multifonction WiFi", "EPSN-L3250-01", "Imprimante sans cartouche Epson économique avec réservoirs d'encre haute capacité.", "https://images.unsplash.com/photo-1612815150546-a6722317373c?w=600&auto=format&fit=crop&q=80", "1750.00", "2299.00", 18, 4, "Imprimantes"},
                {"Canon EOS R6 Mark II Mirrorless Body", "CANN-R6M2-01", "Appareil photo hybride Canon plein format avec stabilisation d'image 8-stops et vidéo 4K 60p.", "https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=600&auto=format&fit=crop&q=80", "20500.00", "24999.00", 5, 1, "Appareils Photo"},
                {"TP-Link Archer AX55 WiFi 6 Router", "TPLK-AX55-01", "Routeur gigabit TP-Link double bande WiFi 6 avec sécurité Homeshield.", "https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=600&auto=format&fit=crop&q=80", "650.00", "899.00", 30, 5, "Réseau"},
                {"Kaspersky Total Security 2026 5-Devices", "KASP-KTS-01", "Suite antivirus et protection informatique Kaspersky complète valable 1 an.", "https://images.unsplash.com/photo-1563986768609-322da13575f3?w=600&auto=format&fit=crop&q=80", "250.00", "399.00", 50, 10, "Logiciels"},
                {"Jabra Evolve2 65 Wireless Stereo", "JABR-EV65-01", "Casque d'entreprise Jabra certifié Microsoft Teams avec isolation phonique supérieure.", "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80", "1650.00", "2199.00", 16, 4, "Audio"},
                {"HyperX Cloud III Wireless Gaming", "HYPX-CL3-01", "Casque gaming léger HyperX avec autonomie record de 120 heures et son spatial DTS.", "https://images.unsplash.com/photo-1583394838336-acd977736f90?w=600&auto=format&fit=crop&q=80", "1100.00", "1499.00", 25, 5, "Audio"},
                {"Netgear Nighthawk AX6 WiFi 6 Router", "NTGR-NH6-01", "Routeur haute performance Netgear Nighthawk idéal pour le streaming 4K et gaming.", "https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=600&auto=format&fit=crop&q=80", "1350.00", "1799.00", 15, 3, "Réseau"},
                {"Pantum Laser Printer M6550NW", "PNTM-M6550-01", "Imprimante multifonction laser Pantum monochrome rapide avec WiFi et scanner.", "https://images.unsplash.com/photo-1612815150546-a6722317373c?w=600&auto=format&fit=crop&q=80", "1200.00", "1599.00", 14, 3, "Imprimantes"},
                {"Aruba Instant On 1930 24G Switch", "ARUB-SW24-01", "Switch gigabit manageable 24 ports Aruba pour réseaux d'entreprise.", "https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=600&auto=format&fit=crop&q=80", "2500.00", "3299.00", 8, 2, "Réseau"}
            };

            for (Object[] row : seedData) {
                String ref = (String) row[1];
                if (prodRepo.findProductByName((String) row[0]).isEmpty()) {
                    Product p = new Product();
                    p.setName((String) row[0]);
                    p.setReference(ref);
                    p.setDescription((String) row[2]);
                    p.setImageUrl((String) row[3]);
                    p.setPurchasePrice(new BigDecimal((String) row[4]));
                    p.setSalePrice(new BigDecimal((String) row[5]));
                    p.setQuantity((Integer) row[6]);
                    p.setMinStock((Integer) row[7]);
                    p.setCategory(catMap.get((String) row[8]));
                    p.setSupplier(defaultSupplier);

                    prodRepo.save(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        JPAUtil.shutdown();
    }
}
