import 'produk.dart';

class ProdukMinuman extends Produk {
  bool dingin;

  ProdukMinuman(super.kode, super.nama, super.kategori, super.harga,
      super.stok, {this.dingin = false});

  ProdukMinuman.baru(String kode, String nama, double harga,
      {this.dingin = false})
      : super.baru(kode, nama, 'Minuman', harga);

  ProdukMinuman.restok(String kode, String nama, double harga, int stokAwal,
      {this.dingin = false})
      : super.restok(kode, nama, 'Minuman', harga, stokAwal);

  @override
  String tampilkanInfo(String prefix) =>
      '${super.tampilkanInfo(prefix)} (${dingin ? 'dingin' : 'hangat'})';
  @override
  double hitungPajak() => harga * 0.10; // sesuaikan tarif minuman dari dosen
}