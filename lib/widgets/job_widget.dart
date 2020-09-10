import 'package:flutter/material.dart';

class JobWidget extends StatelessWidget {
  final String title;
  final String company;
  final String companyLogo;

  const JobWidget({
    Key key,
    this.title,
    this.company,
    this.companyLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(title),
          Text(company),
          Image.network(companyLogo);
        ],
      ),
    );
  }
}
