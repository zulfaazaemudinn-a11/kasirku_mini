import 'produk.dart';

// Jembatan SEMENTARA sampai Pertemuan 6 (diganti ProdukMakanan/ProdukMinuman).
class ProdukBiasa extends Produk {
  ProdukBiasa(String kode, String nama, String kategori, double harga, int stok)
      : super(kode, nama, kategori, harga, stok);

  ProdukBiasa.baru(String kode, String nama, String kategori, double harga)
      : super.baru(kode, nama, kategori, harga);

  ProdukBiasa.restok(
      String kode, String nama, String kategori, double harga, int stokAwal)
      : super.restok(kode, nama, kategori, harga, stokAwal);

  @override
  double hitungPajak() => harga * 0.10; // pajak makanan 10%
}