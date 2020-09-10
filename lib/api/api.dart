import 'package:github_jobs_app/models/job.dart';
import 'package:http/http.dart' as http;
import 'dart:io' as io;

class Api {
  static Future<List<Job>> getAllRemoteJobs() async {
    const baseUrl = "https://jobs.github.com/positions.json";
    const remoteJobsUrl = "$baseUrl?location=remote";
    try {
      final response = await http.get(remoteJobsUrl);
      if (response.statusCode == io.HttpStatus.ok) {
        print("received remote jobs successfully");
        final jobList = jobListFromJson(response.body);
        return jobList.jobs;
      } else {
        print("an error occurred while getting remote jobs");
        print("statusCode: ${response.statusCode}");
        return null;
      }
    } catch (error) {
      print("an error occurred while getting remote jobs: $error");
      return null;
    }
  }
}