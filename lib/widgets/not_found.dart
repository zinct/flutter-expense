import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  final EdgeInsets margin;
  NotFound({Key? key, this.margin = const EdgeInsets.all(0)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150,
            child: Image.asset(
              'assets/images/not_found.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Data tidak ditemukan.',
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
