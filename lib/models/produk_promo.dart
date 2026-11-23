
import 'produk_makanan.dart';
import 'diskon_mixin.dart';

class ProdukPromo extends ProdukMakanan with BisaDiskon {
  final double persenPromo;

  ProdukPromo(
      String kode,
      String nama,
      String kategori,
      double harga,
      int stok, {
        required this.persenPromo,
      }) : super(kode, nama, kategori, harga, stok);

  double get hargaPromo => hitungDiskon(persenPromo);
}
