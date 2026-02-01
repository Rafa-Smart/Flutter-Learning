class CartItem {
  String id;
  String title;
  int price;
  int qty;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.qty,
  });

  //   @override
  // disini kita ovveride method + jadi tiap kai kita tambahkan misal
  //
  operator +(CartItem other) {
    //  disin harus return objek baru
    return CartItem(id: id, title: title, price: price, qty: qty + other.qty);
  }
}
// test
// test
// test
// test
