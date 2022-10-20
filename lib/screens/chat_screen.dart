import 'package:flutter/material.dart';

import 'package:whatsapp_clone/models/users_model.dart';

import '../service/user_service.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  UserService _service = UserService();
  List<UsersModelData?> users = [];
  final double dividerHeight = 10.0;
  bool? isLoading;
  @override
  void initState() {
    super.initState();
    _service.fetchUsers().then((value) {
      if (value != null && value.data != null) {
        setState(() {
          users = value.data!;
          isLoading = true;
        });
      } else {
        isLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => Column(
              children: [
                Divider(
                  height: dividerHeight,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(users[index]!.avatar!),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        users[index]!.firstName!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '02.20',
                        style: TextStyle(
                            fontSize: ItemFont().timeFont,
                            color: ItemColor().textColor),
                      ),
                    ],
                  ),
                  subtitle: Container(
                    padding: ItemPadding().topPadding,
                    child: Text(
                      users[index]!.email!,
                      style: TextStyle(
                        color: ItemColor().textColor,
                        fontSize: ItemFont().mailFont,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class ItemFont {
  final double timeFont = 14.0;
  final double mailFont = 15.0;
}

class ItemColor {
  final Color textColor = Colors.grey;
}

class ItemPadding {
  final EdgeInsetsGeometry topPadding = EdgeInsets.only(top: 5.0);
}
