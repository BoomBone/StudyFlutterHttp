
class Computer {
  final String keyBoard;
  final String mouse;

  Computer(this.keyBoard, this.mouse);

  Computer.fromJson(Map<String, dynamic> json)
      : keyBoard = json['keyBoard'],
        mouse = json['mouse'];

  Map<String,dynamic> toJson()=>
      {
        'keyBoard':keyBoard,
        'mouse':mouse,
      };
}
