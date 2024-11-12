using System;
using System.Collections.Generic;
using System.Linq;
using K22CNT3_BuiAnhVuong_Project02.Models;

namespace K22CNT3_BuiAnhVuong_Project02.Bussiness
{
    public class BAV_ShoppingCart
    {
        public List<BAVCartItem> Items { get; set; }

        public BAV_ShoppingCart()
        {
            Items = new List<BAVCartItem>();
        }

        // Chuc nang them san pham vao gio hang
        public void AddToCart(BAVCartItem item)
        {
            var existingItem = Items.FirstOrDefault(x => x.ID == item.ID);
            if (existingItem != null)
            {
                existingItem.SoLuongMua += item.SoLuongMua;
            }
            else
            {
                Items.Add(item);
            }
        }

        // Xóa sản phẩm trong giỏ hàng
        public void RemoveCartItem(int id)
        {
            var itemToRemove = Items.FirstOrDefault(x => x.ID == id);
            if (itemToRemove != null)
            {
                Items.Remove(itemToRemove);
            }
        }

        // Tính tổng trị giá của hóa đơn
        public float GetTongThanhTien()
        {
            return Items.Sum(x => x.SoLuongMua * x.DonGiaMua);
        }

        // Cập nhật Shopping cart
        public void UpdateFromCart(int id, int qty)
        {
            var existingItem = Items.FirstOrDefault(x => x.ID == id);
            if (existingItem != null)
            {
                existingItem.SoLuongMua = qty;
            }
        }
    }
}
