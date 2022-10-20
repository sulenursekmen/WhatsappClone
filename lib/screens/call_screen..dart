import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/users_model.dart';
import 'package:whatsapp_clone/service/user_service.dart';

class CallScreen extends StatefulWidget {
  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  UserService _service = UserService();
  bool? isLoading;
  final Color iconColor = Colors.green;
  final String callDate = "Bugün 02:25";

  List<UsersModelData?> users = [];
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
                  height: 10.0,
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
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call,
                            color: iconColor,
                          ))
                    ],
                  ),
                  subtitle: Container(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: [
                        Icon(Icons.north_east, color: iconColor, size: 14),
                        Text(callDate),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
