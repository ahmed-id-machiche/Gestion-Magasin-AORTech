package com.magasin.util;

import javax.servlet.ServletException;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.Paths;
import java.util.UUID;

public final class ImageUploadUtil {
    private ImageUploadUtil() {
    }

    public static String saveProductImage(Part part, String realBasePath, String contextPath) throws IOException, ServletException {
        if (part == null || part.getSize() <= 0) {
            return null;
        }

        String submittedFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if (submittedFileName == null || submittedFileName.isBlank()) {
            return null;
        }

        String extension = "";
        int dotIndex = submittedFileName.lastIndexOf('.');
        if (dotIndex >= 0) {
            extension = submittedFileName.substring(dotIndex).toLowerCase();
        }

        if (!isAllowedExtension(extension)) {
            throw new ServletException("Format image non supporte. Utilisez: jpg, jpeg, png, webp, gif.");
        }

        String folderPath = UploadStorageConfig.getProductsUploadDir();
        File folder = new File(folderPath);
        if (!folder.exists() && !folder.mkdirs()) {
            throw new IOException("Impossible de creer le dossier d'upload.");
        }

        String fileName = "product-" + UUID.randomUUID() + extension;
        File destination = new File(folder, fileName);
        part.write(destination.getAbsolutePath());

        return contextPath + "/media/products/" + fileName;
    }

    public static String saveProductImageFromLocalPath(String localPath, String realBasePath, String contextPath) throws IOException, ServletException {
        if (localPath == null || localPath.isBlank()) {
            return null;
        }

        Path source = Paths.get(localPath.trim());
        if (!Files.exists(source) || !Files.isRegularFile(source)) {
            throw new ServletException("Path local invalide ou fichier introuvable.");
        }

        String submittedFileName = source.getFileName().toString();
        String extension = "";
        int dotIndex = submittedFileName.lastIndexOf('.');
        if (dotIndex >= 0) {
            extension = submittedFileName.substring(dotIndex).toLowerCase();
        }
        if (!isAllowedExtension(extension)) {
            throw new ServletException("Format image non supporte. Utilisez: jpg, jpeg, png, webp, gif.");
        }

        String folderPath = UploadStorageConfig.getProductsUploadDir();
        File folder = new File(folderPath);
        if (!folder.exists() && !folder.mkdirs()) {
            throw new IOException("Impossible de creer le dossier d'upload.");
        }

        String fileName = "product-" + UUID.randomUUID() + extension;
        Path destination = Paths.get(folderPath, fileName);
        Files.copy(source, destination, StandardCopyOption.REPLACE_EXISTING);
        return contextPath + "/media/products/" + fileName;
    }

    public static String normalizeImageInput(String value, String realBasePath, String contextPath) throws IOException, ServletException {
        if (value == null || value.isBlank()) {
            return null;
        }

        String trimmed = value.trim();
        String lower = trimmed.toLowerCase();
        if (lower.startsWith("http://") || lower.startsWith("https://") || trimmed.startsWith(contextPath + "/")) {
            return trimmed;
        }

        // If admin pastes a local path in URL field, copy it to uploads and persist a stable app URL.
        if (trimmed.matches("^[a-zA-Z]:\\\\.*") || trimmed.startsWith("\\\\") || trimmed.startsWith("/")) {
            return saveProductImageFromLocalPath(trimmed, realBasePath, contextPath);
        }

        return trimmed;
    }

    private static boolean isAllowedExtension(String extension) {
        return ".jpg".equals(extension)
                || ".jpeg".equals(extension)
                || ".png".equals(extension)
                || ".webp".equals(extension)
                || ".gif".equals(extension)
                || ".jfif".equals(extension);
    }
}
