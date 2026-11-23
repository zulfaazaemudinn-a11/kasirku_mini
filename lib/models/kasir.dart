
import 'keranjang.dart';
import 'transaksi.dart';

class Kasir {
  // Memproses keranjang menjadi transaksi.
  Transaksi layani(Keranjang keranjang) {
    // Pastikan stok seluruh item mencukupi
    // sebelum mengurangi stok produk.
    for (final item in keranjang.isi) {
      if (item.jumlah > item.produk.stok) {
        throw StateError(
          'Stok ${item.produk.nama} tidak mencukupi',
        );
      }
    }

    // Kurangi stok setelah semua item lolos validasi.
    for (final item in keranjang.isi) {
      item.produk.kurangiStok(item.jumlah);
    }

    // Simpan daftar item sebagai transaksi.
    final transaksi = Transaksi(keranjang.isi);

    // Keranjang dikosongkan setelah transaksi berhasil.
    keranjang.kosongkan();

    return transaksi;
  }
}
