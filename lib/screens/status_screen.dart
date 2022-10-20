import 'package:flutter/material.dart';

import 'package:whatsapp_clone/models/users_model.dart';

import '../service/user_service.dart';

class StatusScreen extends StatefulWidget {
  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  UserService _service = UserService();
  List<UsersModelData?> users = [];
  final double dividerHeight = 10.0;
  final String statusDate = "Bugün 02:25";
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
                    ],
                  ),
                  subtitle: Container(
                    child: Text(
                      statusDate,
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

class statePhoto {
  final String url =
      "https://www.google.com/search?q=whatsapp+engelli+profil&tbm=isch&ved=2ahUKEwis1uvI-u76AhUHWxoKHa8uBeIQ2-cCegQIABAA&oq&gs_lcp=CgNpbWcQARgDMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnMgcIIxDqAhAnOgQIIxAnOgUIABCABDoHCAAQsQMQQzoECAAQQzoICAAQgAQQsQNQrRBY_h9g5EFoA3AAeACAAbkEiAGEB5IBBzAuMi41LTGYAQCgAQGqAQtnd3Mtd2l6LWltZ7ABCsABAQ&sclient=img&ei=BlNRY6y7Eoe2aa_dlJAO#imgrc=f5kCE2KLwzPdMM";
}
