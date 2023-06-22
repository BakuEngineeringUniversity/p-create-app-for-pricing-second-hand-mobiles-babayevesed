package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.GridView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

public class ProductsActivity extends AppCompatActivity {

    private GridView gridView;
    private TextView basketTotal;
    private Button gotoBasket;
    private List<Product> products;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_products);

        // Create mock product data
        products = new ArrayList<>();
        products.add(new Product("Product 1", R.drawable.ic_launcher_background, 19.99, "Product 1 Description", false));
        products.add(new Product("Product 2", R.drawable.ic_launcher_foreground, 29.99, "Product 2 Description", false));
        products.add(new Product("Product 3", R.drawable.ic_launcher_foreground, 29.99, "Product 2 Description", false));

        products.add(new Product("Product 4", R.drawable.ic_launcher_foreground, 29.99, "Product 2 Description", false));

        products.add(new Product("Product 5", R.drawable.ic_launcher_foreground, 29.99, "Product 2 Description", false));
        products.add(new Product("Product 6", R.drawable.ic_launcher_foreground, 29.99, "Product 2 Description", false));

        products.add(new Product("Product 2", R.drawable.ic_launcher_foreground, 29.99, "Product 2 Description", false));

        products.add(new Product("Product 2", R.drawable.ic_launcher_foreground, 29.99, "Product 2 Description", false));


        // ... Add as many products as you want

        gridView = findViewById(R.id.gridView);
        basketTotal = findViewById(R.id.basketTotal);
        gotoBasket = findViewById(R.id.gotoBasket);

        ProductAdapter productAdapter = new ProductAdapter(this, products);
        gridView.setAdapter(productAdapter);
        // Add click listener to "Go to Basket" button
        gotoBasket.setOnClickListener(v -> {
            Intent intent = new Intent(ProductsActivity.this, BasketActivity.class);
            startActivity(intent);
        });
    }
    // Call this method whenever a product is added to or removed from the basket
    public void updateBasketTotal() {
        double totalPrice = 0;
        int itemCount = BasketManager.getInstance().getBasketProducts().size();
        for (Product product : BasketManager.getInstance().getBasketProducts()) {
            totalPrice += product.getPrice();
        }
        basketTotal.setText(String.format("Total: $%.2f (%d items)", totalPrice, itemCount));
    }

}

