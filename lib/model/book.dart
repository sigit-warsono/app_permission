class Book {
  final int id;
  final String name;
  final String nip;
  final String image;
  final String religion;
  final String employee_status;
  final String jenis_permission;
  final String note;
  final String tanggal_keluar;
  final String jam_keluar;
  final String jam_pulang;
  final String aprove;

  const Book({
    required this.id,
    required this.name,
    required this.nip,
    required this.image,
    required this.religion,
    required this.employee_status,
    required this.jenis_permission,
    required this.note,
    required this.tanggal_keluar,
    required this.jam_keluar,
    required this.jam_pulang,
    required this.aprove,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json['id'],
    name: json['name'],
    nip: json['nip'],
    image: json['image'],
    religion: json['religion'],
    employee_status: json['employee_status'],
    jenis_permission: json['jenis_permission'],
    note: json['note'],
    tanggal_keluar: json['tanggal_keluar'],
    jam_keluar: json['jam_keluar'],
    jam_pulang: json['jam_pulang'],
    aprove: json['aprove'],

  );

  Map<String, dynamic> toJson()  => {
    'id': id,
    'name': name,
    'nip': nip,
    'image': image,
    'religion':religion,
    'employee_status': employee_status,
    'jenis_permission': jenis_permission,
    'note': note,
    'tanggal_keluar': tanggal_keluar,
    'jam_keluar': jam_keluar,
    'jam_pulang': jam_pulang,
    'aprove' : aprove,
  };
}