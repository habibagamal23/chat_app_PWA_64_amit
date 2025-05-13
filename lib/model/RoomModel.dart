class RoomModel {
  String id;
  String lastMessage;
  int unReadMessage;
  List<String> members;

  RoomModel({
    required this.id,
    required this.lastMessage,
    required this.unReadMessage,
    required this.members,
  });

  factory RoomModel.fromMap(Map<String, dynamic> data) {
    return RoomModel(
        id: data['id'] as String,
        lastMessage: data['lastmssg'] as String,
        unReadMessage: data['unReadMssg'] as int,
        members: data['members'] );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lastmssg': lastMessage,
      'unReadMssg': unReadMessage,
      'members': members,
    };
  }
}
