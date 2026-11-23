
import 'produk.dart';

mixin BisaDiskon on Produk {
  double hitungDiskon(double persen) {
    return harga - (harga * persen / 100);
  }
}
