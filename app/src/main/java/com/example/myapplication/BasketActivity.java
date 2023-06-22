package com.example.myapplication;

import android.os.Bundle;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;

import java.util.List;

public class BasketActivity extends AppCompatActivity {

    private ListView listView;
    private List<Product> basketProducts;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_basket);

        listView = findViewById(R.id.listView);
        basketProducts = BasketManager.getInstance().getBasketProducts();

        ProductAdapter productAdapter = new ProductAdapter(this, basketProducts);
        listView.setAdapter(productAdapter);
    }
}
