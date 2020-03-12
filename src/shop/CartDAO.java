package shop;

import java.util.ArrayList;

public class CartDAO {
    public static ArrayList<Cart> cartItems = new ArrayList<>();

    public static boolean addToCart(Cart cart) {
        if (cartItems.size() == 0) {
            cartItems.add(cart);
            return true;
        } else {
            int count = 0;
            for (Cart cart1 : cartItems) {
                if (cart1.getModel().equals(cart.getModel())) {
                    count++;
                }
            }
            if (count == 0) {
                cartItems.add(cart);
                return true;
            }
        }
        return false;
    }

    public static void removeItem(Cart cart) {
        cartItems.remove(cart);
    }
}