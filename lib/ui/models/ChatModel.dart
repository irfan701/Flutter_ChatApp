class ChatModel {
  String? name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  bool select = false;
  ChatModel(
      {this.name,
      this.icon,
      this.isGroup,
      this.time,
      this.currentMessage,
      this.select = false});
}
