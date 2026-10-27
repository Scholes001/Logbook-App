import 'package:flutter/material.dart';

class OrganizationProfile extends StatefulWidget {
  const OrganizationProfile({super.key});

  @override
  State<OrganizationProfile> createState() => _OrganizationProfileState();
}

class _OrganizationProfileState extends State<OrganizationProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _jobAreasController = TextEditingController();
  final TextEditingController _employmentSizeController = TextEditingController();
  final TextEditingController _otherInfoController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _yearController.dispose();
    _jobAreasController.dispose();
    _employmentSizeController.dispose();
    _otherInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Back arrow + centered title
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back, size: 24),
                    ),
                  ),
                  const Text(
                    'Organization Profile',
                    style: TextStyle(
                      fontSize: 20, // same size as Profile header
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              _buildLabel('Name of Establishment/Company'),
              _buildField(_nameController),
              const SizedBox(height: 20),

              _buildLabel('Location'),
              _buildField(_locationController),
              const SizedBox(height: 20),

              _buildLabel('Year Operation Started'),
              _buildField(_yearController),
              const SizedBox(height: 20),

              _buildLabel('Major Areas/Job Undertaken'),
              // CHANGED: bigger field
              _buildField(_jobAreasController, minLines: 3, maxLines: 3),
              const SizedBox(height: 20),

              _buildLabel('Employment Size'),
              // CHANGED: bigger field
              _buildField(_employmentSizeController, minLines: 3, maxLines: 3),
              const SizedBox(height: 20),

              _buildLabel('Any other Relevant Information'),
              // CHANGED: bigger field
              _buildField(_otherInfoController, minLines: 3, maxLines: 3),
              const SizedBox(height: 20),

              Row(
                children: const [
                  Text(
                    'Upload Attachment',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.attach_file, size: 16),
                ],
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  // TODO: handle file/image picking
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF2FF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF3B82F6), width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'JPG, PNG, PDF (Max 5MB)',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 28),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, {int? minLines, int? maxLines}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF3B82F6), width: 1),
      ),
      child: TextField(
        controller: controller,
        minLines: minLines,
        maxLines: maxLines ?? 1,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }
}