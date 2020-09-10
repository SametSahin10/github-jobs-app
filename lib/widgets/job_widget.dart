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
    final screenHeight = MediaQuery.of(context).size.height;
    return Card(
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 22)),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(company, style: TextStyle(fontSize: 16)),
          SizedBox(height: screenHeight * 0.01),
          companyLogo == null
              ? Container()
              : Container(
                  height: screenHeight * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Image.network(companyLogo, fit: BoxFit.contain),
                  ),
                ),
        ],
      ),
    );
  }
}
