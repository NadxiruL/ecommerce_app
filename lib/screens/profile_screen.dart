import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://scontent.fkul8-1.fna.fbcdn.net/v/t39.30808-6/258787310_4744416522247604_975545725235886751_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=ifBUIFQz8xsAX9TVuA4&_nc_ht=scontent.fkul8-1.fna&oh=00_AT-Ctqsvunq4HhV8TZX84IOgEYETZqCn1Za5QMztgBMqIQ&oe=6317A7A9'),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Nadzirul Mubin bin Mohd'),
                    Text('nadzirulmubin@hotmail.com'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'General',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Edit profile'),
                          Divider(color: Colors.black),
                          Text('Settings'),
                          Divider(color: Colors.black),
                          Text('Help centre'),
                          Divider(color: Colors.black),
                          Text('Share feedback'),
                          Divider(color: Colors.black),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'https://github.com/NadxiruL',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
