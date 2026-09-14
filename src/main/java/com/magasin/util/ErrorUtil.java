package com.magasin.util;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public final class ErrorUtil {
    private ErrorUtil() {
    }

    public static String encode(String value) {
        return URLEncoder.encode(value, StandardCharsets.UTF_8);
    }

    public static String toUserMessage(Throwable throwable) {
        if (throwable == null) {
            return "Operation impossible.";
        }
        String stack = flatten(throwable).toLowerCase();
        if (stack.contains("constraintviolationexception") || stack.contains("sqlintegrityconstraintviolationexception")) {
            if (stack.contains("foreign key")) {
                return "Suppression impossible: cet element est utilise ailleurs (liaison de donnees).";
            }
            if (stack.contains("duplicate") || stack.contains("unique")) {
                return "Valeur deja existante. Verifiez les champs uniques (reference, username, email...).";
            }
            return "Contrainte base de donnees non respectee.";
        }
        if (stack.contains("numberformatexception")) {
            return "Donnees numeriques invalides.";
        }
        return "Erreur technique pendant l'operation. Verifiez les donnees saisies.";
    }

    private static String flatten(Throwable throwable) {
        StringBuilder sb = new StringBuilder();
        Throwable current = throwable;
        while (current != null) {
            sb.append(current.getClass().getName()).append(": ").append(current.getMessage()).append(" | ");
            current = current.getCause();
        }
        return sb.toString();
    }
}

