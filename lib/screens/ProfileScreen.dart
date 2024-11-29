import 'package:flutter/material.dart';
import 'EditProfile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  // Profile details
  String name = "Name";
  String bio = "I believe fitness is about more than just physical health—it’s about building mental resilience, boosting confidence, and improving overall well-being. With small, consistent steps, I’m working towards being the best version of myself every day.";
  String age = "20";
  String interests = "90's Music,Long Walks,Shopping";
  String disability = "Arm mobility";
  String weight = "55";
  String height = "5.5 feet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(169, 234, 0, 255),
                    width: 1.5,
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _buildInfoSection('Name', name),
            _buildInfoSection('Bio/Description', bio),
            _buildInfoSection('Age', age),
            _buildInfoSection('Interests', interests),
            _buildInfoSection('Disability', disability),
            _buildInfoSection('Weight', weight),
            _buildInfoSection('Height', height),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            GestureDetector(
              onTap: () async {
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(
                      name: name,
                      bio: bio,
                      age: age,
                      interests: interests,
                      disability: disability,
                      weight: weight,
                      height: height,
                    ),
                  ),
                );
                if (updatedData != null) {
                  setState(() {
                    name = updatedData['name'];
                    bio = updatedData['bio'];
                    age = updatedData['age'];
                    interests = updatedData['interests'];
                    disability = updatedData['disability'];
                    weight = updatedData['weight'];
                    height = updatedData['height'];
                  });
                }
              },
              child: Container(
                width: 140,
                height: 37,
                decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 102, 2, 105),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String label, String value) {
  // Determine if the section should be centered (name or bio)
  bool isCentered = label == 'Name' || label == 'Bio/Description';

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Align(
      alignment: isCentered ? Alignment.center : Alignment.centerLeft,
      child: Text(
        value,
        textAlign: isCentered ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          fontSize: isCentered ? 20 : 16, // Slightly larger font for centered items
          fontWeight: isCentered ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    ),
  );
}

}
