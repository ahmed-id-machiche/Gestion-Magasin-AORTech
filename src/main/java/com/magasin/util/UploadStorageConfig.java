package com.magasin.util;

import java.io.File;

public final class UploadStorageConfig {
    private UploadStorageConfig() {
    }

    public static String getProductsUploadDir() {
        String base = System.getProperty("user.home") + File.separator + "magasin-uploads";
        return base + File.separator + "products";
    }
}

