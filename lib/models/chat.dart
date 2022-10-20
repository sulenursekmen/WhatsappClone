class Chat {
  String name;
  String message;
  String time;
  String avatarUrl;
  Chat(
      {required this.name,
      required this.message,
      required this.time,
      required this.avatarUrl});
}

List<Chat> fakeData = [
  Chat(
      name: "Sullens",
      message: "Merhaba Nasılsın",
      time: "02.20",
      avatarUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuisEAmHk0wy0KxnTyuzVdNekb4sXr1tm6Pg&usqp=CAU"),
  Chat(
      name: "John",
      message: "Şuleeee",
      time: "05.08",
      avatarUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuisEAmHk0wy0KxnTyuzVdNekb4sXr1tm6Pg&usqp=CAU"),
  Chat(
      name: "William",
      message: " Nasılsın",
      time: "03.20",
      avatarUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuisEAmHk0wy0KxnTyuzVdNekb4sXr1tm6Pg&usqp=CAU"),
  Chat(
      name: "Robert",
      message: "Merhabaa",
      time: "04.20",
      avatarUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuisEAmHk0wy0KxnTyuzVdNekb4sXr1tm6Pg&usqp=CAU"),
];
