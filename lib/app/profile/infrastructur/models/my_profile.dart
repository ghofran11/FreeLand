import 'package:freeland/app/home/infrastructure/models/service.dart';

class MyProfile {
  late String id;
  late String fullName;
  late String? bio;
  late int numOfCompletedProjects;
  late int numOfConnections;
  late int evalution;
  late List<CareerDtos> careerDtos;
  late List<EducationDtos> educationDtos;
  late List<ServiceDto> serviceDtos;
  late List<WorkDtos> workDtos;
  late List<ConnectedUsers> connectedUsers;

  MyProfile(
      {required this.id,
      required this.fullName,
      required this.bio,
      required this.numOfCompletedProjects,
      required this.numOfConnections,
      required this.evalution,
      required this.careerDtos,
      required this.educationDtos,
      required this.serviceDtos,
      required this.workDtos,
      required this.connectedUsers});

  MyProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    bio = json['bio'];
    numOfCompletedProjects = json['numOfCompletedProjects'];
    numOfConnections = json['numOfConnections'];
    evalution = json['evalution'];
    if (json['careerDtos'] != null) {
      careerDtos = [];
      json['careerDtos'].forEach((v) {
        careerDtos.add(CareerDtos.fromJson(v));
      });
    }
    if (json['educationDtos'] != null) {
      educationDtos = [];
      json['educationDtos'].forEach((v) {
        educationDtos.add(EducationDtos.fromJson(v));
      });
    }
    if (json['serviceDtos'] != null) {
      serviceDtos = [];
      json['serviceDtos'].forEach((v) {
        serviceDtos.add(ServiceDto.fromMap(v));
      });
    }
    if (json['workDtos'] != null) {
      workDtos = [];
      json['workDtos'].forEach((v) {
        workDtos.add(WorkDtos.fromJson(v));
      });
    }
    if (json['connectedUsers'] != null) {
      connectedUsers = [];
      json['connectedUsers'].forEach((v) {
        connectedUsers.add(ConnectedUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['bio'] = bio;
    data['numOfCompletedProjects'] = numOfCompletedProjects;
    data['numOfConnections'] = numOfConnections;
    data['evalution'] = evalution;
    data['careerDtos'] = careerDtos.map((v) => v.toJson()).toList();
    data['educationDtos'] = educationDtos.map((v) => v.toJson()).toList();
    data['serviceDtos'] = serviceDtos.map((v) => v.toJson()).toList();
    data['workDtos'] = workDtos.map((v) => v.toJson()).toList();
    data['connectedUsers'] = connectedUsers.map((v) => v.toJson()).toList();
    return data;
  }
}

class CareerDtos {
  late String id;
  late String name;

  CareerDtos({required this.id, required this.name});

  CareerDtos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class EducationDtos {
  late String id;
  late DateTime startDate;
  late DateTime graduationDate;
  late String name;

  EducationDtos({
    required this.id,
    required this.startDate,
    required this.graduationDate,
    required this.name,
  });

  EducationDtos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = DateTime.parse(json['startDate']);
    graduationDate = DateTime.parse(json['graduationDate']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startDate'] = startDate;
    data['graduationDate'] = graduationDate;
    data['name'] = name;
    return data;
  }
}

class WorkDtos {
  late String id;
  late String name;
  late String description;
  late String link;
  late String createdDate;

  WorkDtos({
    required this.id,
    required this.name,
    required this.description,
    required this.link,
    required this.createdDate,
  });

  WorkDtos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    link = json['link'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['link'] = link;
    data['createdDate'] = createdDate;
    return data;
  }
}

class ConnectedUsers {
  late String id;
  late String name;
  late String imagePath;

  ConnectedUsers({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  ConnectedUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imagePath'] = imagePath;
    return data;
  }
}
