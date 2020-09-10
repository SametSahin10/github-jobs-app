import 'package:flutter/material.dart';
import 'package:github_jobs_app/api/api.dart';
import 'package:github_jobs_app/models/job.dart';
import 'package:github_jobs_app/widgets/job_widget.dart';

class JobsScreen extends StatefulWidget {
  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  Future<List<Job>> jobsFuture;

  @override
  void initState() {
    super.initState();
    jobsFuture = Api.getAllRemoteJobs();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: jobsFuture,
      builder: (BuildContext context, AsyncSnapshot<List<Job>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.length,
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                return JobWidget(
                  title: snapshot.data[index].title,
                  company: snapshot.data[index].company,
                  companyLogo: snapshot.data[index].companyLogo,
                );
              },
            );
          } else {
            return Center(child: Icon(Icons.error));
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
