import 'dart:convert';
import 'package:flutter/material.dart';

class Job {
  final String id;
  final String type;
  final String url;
  final String createdAt;
  final String company;
  final String companyUrl;
  final String location;
  final String title;
  final String description;
  final String howToApply;
  final String companyLogo;

  const Job({
    @required this.id,
    @required this.type,
    @required this.url,
    @required this.createdAt,
    @required this.company,
    @required this.companyUrl,
    @required this.location,
    @required this.title,
    @required this.description,
    @required this.howToApply,
    @required this.companyLogo,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    type: json["type"],
    url: json["url"],
    createdAt: json["created_at"],
    company: json["company"],
    companyUrl: json["company_url"],
    location: json["location"],
    title: json["title"],
    description: json["description"],
    howToApply: json["how_to_apply"],
    companyLogo: json["company_logo"],
  );
}

class JobList {
  final List<Job> jobs;

  JobList({@required this.jobs});

  factory JobList.fromJson(List<dynamic> json) {
    return JobList(jobs: json.map((job) {
      return Job.fromJson(job as Map<String, dynamic>);
    }).toList());
  }
}

Job jobFromJson(String responseBody) => Job.fromJson(json.decode(responseBody));

JobList jobListFromJson(String responseBody) {
  return JobList.fromJson(json.decode(responseBody));
}