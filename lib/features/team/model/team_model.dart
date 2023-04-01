class TeamMember {
  final String fullName;
  final String bio;
  final String profilePicture;
  final List<Map<String, dynamic>> links;
  final String tagLine;

  TeamMember({
    required this.fullName,
    required this.bio,
    required this.profilePicture,
    required this.links,
    required this.tagLine,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> links =
    List<Map<String, dynamic>>.from(json['links'].map((x) => {
      'title': x['title'],
      'url': x['url'],
    }));
    return TeamMember(
      fullName: json['fullName'],
      bio: json['bio'],
      profilePicture: json['profilePicture'],
      links: links,
      tagLine: json['tagLine'],
    );
  }

  toJson() {
    return {
      'fullName': fullName,
      'bio': bio,
      'profilePicture': profilePicture,
      'links': links.map((link) => link).toList(),
      'tagLine': tagLine,
    };
  }
}

class Team {
  final List<TeamMember> teamMembers;
  final String title;

  Team({
    required this.teamMembers,
    required this.title,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    List<TeamMember> teamMembers =
    List<TeamMember>.from(json['data'].map((x) => TeamMember.fromJson(x)));
    return Team(
      teamMembers: teamMembers,
      title: json['team'],
    );
  }

  toJson() {
    return {
      'team': title,
      'data': teamMembers.map((teamMember) => teamMember.toJson()).toList(),
    };
  }
}