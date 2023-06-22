package com.example.myapplication;

import java.util.ArrayList;
import java.util.List;

public class BasketManager {
    private static BasketManager instance;
    private List<Product> basketProducts;

    private BasketManager() {
        basketProducts = new ArrayList<>();
    }

    public static BasketManager getInstance() {
        if (instance == null) {
            instance = new BasketManager();
        }
        return instance;
    }

    public List<Product> getBasketProducts() {
        return basketProducts;
    }

    public void addToBasket(Product product) {
        basketProducts.add(product);
    }

    public void removeFromBasket(Product product) {
        basketProducts.remove(product);
    }
}
