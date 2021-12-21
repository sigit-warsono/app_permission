class Sopir {
  final int id;
  final String name;
  final String nip;
  final String image;
  final String religion;
  final String employee_status;
  final String jenis_mobil;
  final String tujuan;
  final String tanggal;
  final String jam_keluar;
  final String jam_pulang;
  final String penumpang;
  final String approve;

  const Sopir({
    required this.id,
    required this.name,
    required this.nip,
    required this.image,
    required this.religion,
    required this.employee_status,
    required this.jenis_mobil,
    required this.tujuan,
    required this.tanggal,
    required this.jam_keluar,
    required this.jam_pulang,
    required this.penumpang,
    required this.approve,
  });

  factory Sopir.fromJson(Map<String, dynamic> json) => Sopir(
    id: json['id'],
    name: json['name'],
    nip: json['nip'],
    image: json['image'],
    religion: json['religion'],
    employee_status: json['employee_status'],
    jenis_mobil: json['jenis_mobil'],
    tujuan: json['tujuan'],
    tanggal: json['tanggal'],
    jam_keluar: json['jam_keluar'],
    jam_pulang: json['jam_pulang'],
    penumpang: json['penumpang'],
    approve: json['approve'],

  );

  Map<String, dynamic> toJson()  => {
    'id': id,
    'name': name,
    'nip': nip,
    'image': image,
    'religion':religion,
    'employee_status': employee_status,
    'jenis_mobil': jenis_mobil,
    'tujuan': tujuan,
    'tanggal': tanggal,
    'jam_keluar': jam_keluar,
    'jam_pulang': jam_pulang,
    'penumpang': penumpang,
    'approve' : approve,
  };
}