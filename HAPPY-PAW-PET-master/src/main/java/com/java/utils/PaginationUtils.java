package com.java.utils;

import java.util.ArrayList;
import java.util.List;

public class PaginationUtils {

    public static List<String> getPaginationLinks(int currentPage, int totalPages) {
        List<String> links = new ArrayList<>();
        int startPage = ((currentPage - 1) / 10) * 10 + 1;
        int endPage = Math.min(startPage + 9, totalPages);

        if (startPage > 1) {
            links.add("1");
            links.add("...");
        }

        for (int i = startPage; i <= endPage; i++) {
            links.add(String.valueOf(i));
        }

        if (endPage < totalPages) {
            links.add("...");
            links.add(String.valueOf(totalPages));
        }

        return links;
    }
}
