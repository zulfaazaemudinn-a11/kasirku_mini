
import 'produk.dart';

class ItemTransaksi {
  final Produk produk;
  final int jumlah;

  ItemTransaksi({
    required this.produk,
    required this.jumlah,
  }) {
    if (jumlah <= 0) {
      throw ArgumentError('Jumlah harus lebih dari nol');
    }
  }

  double get subtotal => produk.harga * jumlah;
}
