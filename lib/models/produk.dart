abstract class Produk {
  // Identitas produk tidak dapat diganti setelah dibuat.
  final String kode;
// Method abstrak: wajib di-override oleh subclass.
  double hitungPajak();
  // Nama dan kategori sengaja dibuat public.
  String nama;
  String kategori;

  // Harga dan stok disimpan sebagai field private.
  double _harga;
  int _stok;

  // Status ketersediaan mengikuti jumlah stok.
  bool get tersedia => _stok > 0;

  // Constructor dasar untuk class turunan.
  Produk(
      this.kode,
      this.nama,
      this.kategori,
      double hargaAwal,
      int stokAwal,
      )   : _harga = hargaAwal,
        _stok = stokAwal {
    if (hargaAwal < 0) {
      throw ArgumentError('Harga tidak boleh negatif');
    }

    if (stokAwal < 0) {
      throw ArgumentError('Stok tidak boleh negatif');
    }
  }

  // Named constructor: produk baru, stok awal 0 (redirection).
  Produk.baru(String kode, String nama, String kategori, double harga)
      : this(kode, nama, kategori, harga, 0);

  // Named constructor: produk langsung di-restock (redirection).
  Produk.restok(
      String kode, String nama, String kategori, double harga, int stokAwal)
      : this(kode, nama, kategori, harga, stokAwal);

  // Getter: membaca harga.
  double get harga => _harga;

  // Getter: membaca stok.
  int get stok => _stok;

  // Setter: mengubah harga dengan validasi.
  set harga(double nilai) {
    if (nilai < 0) {
      throw ArgumentError('Harga tidak boleh negatif');
    }

    _harga = nilai;
  }

  // Menampilkan info produk (Pertemuan 3); di-override oleh ProdukMinuman.
  String tampilkanInfo(String prefix) =>
      '$prefix$nama - Rp${_harga.toStringAsFixed(0)}';

  // Menambah stok melalui method resmi.
  void tambahStok(int jumlah, [String? catatan]) {
    if (jumlah <= 0) {
      throw ArgumentError('Jumlah stok harus positif');
    }

    _stok += jumlah;

    if (catatan != null) print('Catatan restok: $catatan');
  }

  // Mengurangi stok saat transaksi.
  void kurangiStok(int jumlah) {
    if (jumlah <= 0) {
      throw ArgumentError('Jumlah harus positif');
    }

    if (jumlah > _stok) {
      throw StateError('Stok produk tidak mencukupi');
    }

    _stok -= jumlah;
  }

  // Mengatur diskon dalam persentase.
  void aturDiskon(double persen) {
    if (persen < 0 || persen > 100) {
      throw ArgumentError(
        'Diskon harus antara 0 sampai 100 persen',
      );
    }

    _harga = _harga * (1 - persen / 100);

  }
}