package com.example.myapplication;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class ProductAdapter extends ArrayAdapter<Product> {

    private Context context;
    private List<Product> productList;

    public ProductAdapter(Context context, List<Product> productList) {
        super(context, R.layout.product_item, productList);
        this.context = context;
        this.productList = productList;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View listItem = convertView;
        if (listItem == null)
            listItem = LayoutInflater.from(context).inflate(R.layout.product_item, parent, false);

        Product currentProduct = productList.get(position);

        ImageView productImage = listItem.findViewById(R.id.productImage);
        TextView productName = listItem.findViewById(R.id.productName);
        TextView productPrice = listItem.findViewById(R.id.productPrice);
        TextView productDesc = listItem.findViewById(R.id.productDesc);
        Button basketButton = listItem.findViewById(R.id.basketButton);

        productImage.setImageResource(currentProduct.getImage());
        productName.setText(currentProduct.getName());
        productPrice.setText("$" + currentProduct.getPrice());
        productDesc.setText(currentProduct.getDesc());
        basketButton.setText(currentProduct.isInBasket() ? "Remove from Basket" : "Add to Basket");

        basketButton.setOnClickListener(v -> {
            if (currentProduct.isInBasket()) {
                BasketManager.getInstance().removeFromBasket(currentProduct);
            } else {
                BasketManager.getInstance().addToBasket(currentProduct);
            }
            currentProduct.setInBasket(!currentProduct.isInBasket());
            basketButton.setText(currentProduct.isInBasket() ? "Remove from Basket" : "Add to Basket");
            ((ProductsActivity) context).updateBasketTotal();
        });


        return listItem;
    }
}
