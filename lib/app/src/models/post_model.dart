class PostModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PostModel({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  factory PostModel.fromJson(Map<String, dynamic> json) {
   return PostModel(
     albumId: json['albumId']?.toInt() ?? 0, 
     id: json['id']?.toInt() ?? 0, 
     title: json['title'] ?? 'Sem título', 
     url: json['url'], 
     thumbnailUrl: json['thumbnailUrl']
     );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }

  convertInt(int valor) {
    String valorConvertido = valor.toString();
    return valorConvertido;
  }
}
