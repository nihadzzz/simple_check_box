import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../data/services/users_service.dart';

import '../../data/models/remote/users_model.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late final Future<List<Users>> _fetchUsers;

  @override
  void initState() {
    _fetchUsers = UsersService().fetchUsers(page: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: FutureBuilder(
        future: _fetchUsers,
        builder: (_, snapshot) {
          List<Users> users = snapshot.data ??
              [
                for (int i = 0; i < 6; i++)
                  Users(
                    id: 0,
                    email: 'fmeiownofim3eomfommfwfew',
                    firstName: 'f3f3ff3',
                    lastName: 'frf3f3ef3e',
                    avatar: 'https://reqres.in/img/faces/7-image.jpg',
                    fullName: 'fmi3jfiom3iof3 fmi3mfio3',
                  )
              ];
          return Skeletonizer(
            enabled: !snapshot.hasData ? true : false,
            enableSwitchAnimation: true,
            child: ListView.separated(
              itemCount: users.length,
              separatorBuilder: (_, i) => const SizedBox(
                height: 5,
              ),
              itemBuilder: (_, index) {
                Users user = users[index];
                return ListTile(
                  leading: Image.network(user.avatar),
                  title: Text(user.fullName),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      log('users length: ${users.length}');
                      await UsersService().deleteUser(user.id);
                      log('passed');
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
