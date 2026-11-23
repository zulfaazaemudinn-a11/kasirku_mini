import 'produk.dart';

class ProdukMakanan extends Produk {
  ProdukMakanan(super.kode, super.nama, super.kategori, super.harga,
      super.stok);

  ProdukMakanan.baru(String kode, String nama, double harga)
      : this(kode, nama, 'Makanan', harga, 0);

  ProdukMakanan.restok(String kode, String nama, double harga, int stokAwal)
      : this(kode, nama, 'Makanan', harga, stokAwal);

  @override
  double hitungPajak() => harga * 0.10; // pajak makanan 10%
}