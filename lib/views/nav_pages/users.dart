import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Text('Total Users - 20',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600
          ),),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_,i){
              return Card(
                child: ListTile(
                  title: Text('user name'),
                  subtitle: Text('user email'),
                  leading: Icon(Icons.person_outlined),
                ),
              );
            },
           separatorBuilder: (context,i){
             return Divider();
           },
            itemCount: 20
            ),
        ),
      ],
    );
  }
}