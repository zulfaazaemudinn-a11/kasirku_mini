
import 'item_transaksi.dart';
import 'bisa_dicetak.dart';

class Transaksi implements BisaDicetak {
  final List<ItemTransaksi> _items;

  Transaksi(List<ItemTransaksi> items)
      : _items = List.unmodifiable(items);

  // Getter hanya-baca.
  List<ItemTransaksi> get items =>
      List.unmodifiable(_items);

  // Menghitung total seluruh item.
  double get totalHarga {
    double total = 0;

    for (final item in _items) {
      total += item.subtotal;
    }

    return total;
  }

  // Implementasi interface BisaDicetak.
  @override
  String cetakStruk() {
    final buffer = StringBuffer();

    buffer.writeln('=== STRUK TRANSAKSI ===');

    for (final item in _items) {
      buffer.writeln(
        '${item.produk.nama} x${item.jumlah} = Rp${item.subtotal.toStringAsFixed(0)}',
      );
    }

    buffer.writeln(
      'TOTAL: Rp${totalHarga.toStringAsFixed(0)}',
    );

    return buffer.toString();
  }
}
