class Message {
  String text;
  DateTime date;
  bool isSentByMe;

  Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });

  static List<Message> getMessages() {
    return [
      Message(
        text:
            "Hi, Aneeta, How’re You. I’m Jackson From College. Hope You’ll Be Fine And Also Your Family Aneeta. Waiting for your Reply !",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true,
      ),
      Message(
        text: "Yes we are fine, wow really nice",
        date: DateTime.now().subtract(const Duration(minutes: 2)),
        isSentByMe: false,
      ),
      Message(
        text: "Please, Can you give me Notes",
        date: DateTime.now().subtract(const Duration(minutes: 3)),
        isSentByMe: true,
      ),
      Message(
        text: "Ok, I give you But Where!",
        date: DateTime.now().subtract(const Duration(minutes: 4)),
        isSentByMe: false,
      ),
      Message(
        text: "Thanks, At College",
        date: DateTime.now().subtract(const Duration(minutes: 5)),
        isSentByMe: true,
      ),
      Message(
        text:
            "Hi, Aneeta, How’re You. I’m Jackson From College. Hope You’ll Be Fine And Also Your Family Aneeta. Waiting for your Reply !",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true,
      ),
      Message(
        text: "Yes we are fine, wow really nice",
        date: DateTime.now().subtract(const Duration(minutes: 2)),
        isSentByMe: false,
      ),
      Message(
        text: "Please, Can you give me Notes",
        date: DateTime.now().subtract(const Duration(minutes: 3)),
        isSentByMe: true,
      ),
      Message(
        text: "Ok, I give you But Where!",
        date: DateTime.now().subtract(const Duration(minutes: 4)),
        isSentByMe: false,
      ),
      Message(
        text: "Thanks, At College",
        date: DateTime.now().subtract(const Duration(minutes: 5)),
        isSentByMe: true,
      ),
    ].toList();
  }
}
