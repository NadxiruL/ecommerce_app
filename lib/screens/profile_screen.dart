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
                backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/C5603AQF7UpXLBW8rxA/profile-displayphoto-shrink_800_800/0/1661490832894?e=1668643200&v=beta&t=d5d74MvnGMiG5zJEsRntjAvLBLCC4MsBuDjHG5qIbiQ'),
                radius: 100,
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
