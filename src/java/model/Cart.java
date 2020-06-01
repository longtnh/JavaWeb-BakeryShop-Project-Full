/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

public class Cart {

    protected int total;
    protected ArrayList<Pro_Order> al = new ArrayList<>();

    public Cart() {
    }

    public int getTotal() {
        total = 0;
        for (Pro_Order x : al) {
            total += x.getTotal();
        }
        return total;
    }

    public ArrayList<Pro_Order> getAl() {
        return al;
    }

    public void setAl(ArrayList<Pro_Order> al) {
        this.al = al;
    }

    @Override
    public String toString() {
        return "Cart{" + "total=" + total + ", al=" + al + '}';
    }

    //-----------------------------------------------------------------------------------------
    public void addToCart(Product x) {
        for (Pro_Order m : al) {
            if (x.getP_id() == m.getP_id()) {
                if (m.getStock() >= 1) {
                    m.setQuantity(m.getQuantity() + 1);
//                    m.setStock(m.getStock() - 1);
                }
                return;
            }
        }
        x.setStock(x.getStock() - 1);
        al.add(new Pro_Order(1, x.getP_id(), x.getType_id(), x.getPrice(), x.getStock(), x.getPname(), x.getDe(), x.getImage()));
        return;
    }

    public void removePro(Product p) {
        for (Pro_Order x : al) {
            if (x.getP_id() == p.getP_id()) {
                if (x.getQuantity() == 1) {
                    al.remove(al.indexOf(x));
//                    x.setStock(x.getStock() + 1);
                    return;
                } else {
                    x.setQuantity(x.getQuantity() - 1);
//                    x.setStock(x.getQuantity() + 1);
                    return;
                }
            }
        }
    }

    public void delete() {
        al.clear();
    }
}
