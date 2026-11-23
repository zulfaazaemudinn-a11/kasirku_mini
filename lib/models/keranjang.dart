
import 'produk.dart';
import 'item_transaksi.dart';

class Keranjang {
  final List<ItemTransaksi> _isi = [];

  // Getter hanya-baca untuk daftar belanja.
  List<ItemTransaksi> get isi =>
      List.unmodifiable(_isi);

  // Menambahkan produk ke keranjang.
  void tambah(
      Produk produk, {
        required int jumlah,
      }) {
    if (jumlah <= 0) {
      throw ArgumentError(
        'Jumlah pembelian harus lebih dari nol',
      );
    }

    if (jumlah > produk.stok) {
      throw StateError(
        'Stok ${produk.nama} tidak mencukupi',
      );
    }

    _isi.add(
      ItemTransaksi(
        produk: produk,
        jumlah: jumlah,
      ),
    );
  }

  // Menghitung jumlah baris item dalam keranjang.
  int get jumlahItem => _isi.length;

  // Menghitung total belanja.
  double get totalHarga {
    double total = 0;

    for (final item in _isi) {
      total += item.subtotal;
    }

    return total;
  }

  // Mengosongkan keranjang setelah transaksi berhasil.
  void kosongkan() {
    _isi.clear();
  }
}
