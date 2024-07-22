class GetBarang {
  String? statusCode;
  String? responses;
  int? totalResults;
  List<Results>? results;

  GetBarang({this.statusCode, this.responses, this.totalResults, this.results});

  GetBarang.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    responses = json['Responses'];
    totalResults = json['totalResults'];
    if (json['Results'] != null) {
      results = <Results>[];
      json['Results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['Responses'] = this.responses;
    data['totalResults'] = this.totalResults;
    if (this.results != null) {
      data['Results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? nama;
  String? gambarimage;
  List<TipeDetails>? tipeDetails;

  Results({this.id, this.nama, this.gambarimage, this.tipeDetails});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    gambarimage = json['gambarimage'];
    if (json['tipe_details'] != null) {
      tipeDetails = <TipeDetails>[];
      json['tipe_details'].forEach((v) {
        tipeDetails!.add(new TipeDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['gambarimage'] = this.gambarimage;
    if (this.tipeDetails != null) {
      data['tipe_details'] = this.tipeDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TipeDetails {
  int? tipeId;
  String? namaTipe;
  String? ukuran;
  int? stok;

  TipeDetails({this.tipeId, this.namaTipe, this.ukuran, this.stok});

  TipeDetails.fromJson(Map<String, dynamic> json) {
    tipeId = json['tipe_id'];
    namaTipe = json['nama_tipe'];
    ukuran = json['ukuran'];
    stok = json['stok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipe_id'] = this.tipeId;
    data['nama_tipe'] = this.namaTipe;
    data['ukuran'] = this.ukuran;
    data['stok'] = this.stok;
    return data;
  }
}