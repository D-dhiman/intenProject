import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final String name;
  final String bio;
  final String age;
  final String interests;
  final String disability;
  final String weight;
  final String height;

  const EditProfile({
    super.key,
    required this.name,
    required this.bio,
    required this.age,
    required this.interests,
    required this.disability,
    required this.weight,
    required this.height,
  });

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController bioController;
  late TextEditingController ageController;
  late TextEditingController interestsController;
  late TextEditingController disabilityController;
  late TextEditingController weightController;
  late TextEditingController heightController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    bioController = TextEditingController(text: widget.bio);
    ageController = TextEditingController(text: widget.age);
    interestsController = TextEditingController(text: widget.interests);
    disabilityController = TextEditingController(text: widget.disability);
    weightController = TextEditingController(text: widget.weight);
    heightController = TextEditingController(text: widget.height);
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    ageController.dispose();
    interestsController.dispose();
    disabilityController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color.fromARGB(255, 102, 2, 105),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildInputField('Name', nameController),
              _buildInputField('Bio/Description', bioController, maxLines: 3),
              _buildInputField('Age', ageController),
              _buildInputField('Interests', interestsController),
              _buildInputField('Disability', disabilityController),
              _buildInputField('Weight', weightController),
              _buildInputField('Height', heightController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'name': nameController.text,
                    'bio': bioController.text,
                    'age': ageController.text,
                    'interests': interestsController.text,
                    'disability': disabilityController.text,
                    'weight': weightController.text,
                    'height': heightController.text,
                  });
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
