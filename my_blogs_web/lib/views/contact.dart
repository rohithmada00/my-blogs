import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:my_blogs_web/widgets/custom_elevated_button.dart';
import 'dart:convert';

import 'package:my_blogs_web/widgets/custom_text_form_field.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              labelText: 'Name',
              hintText: 'Enter your name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              controller: _nameController,
            ),
            CustomTextFormField(
              labelText: 'Email',
              hintText: 'Enter your email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              controller: _emailController,
            ),
            CustomTextFormField(
              labelText: 'Message',
              hintText: 'Enter your message',
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
              controller: _messageController,
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _sendEmail();
                }
              },
              // child: const Text('Send'),
              text: 'SEND MESSAGE',
              icon: FontAwesomeIcons.solidPaperPlane,
            ),
          ],
        ),
      ),
    );
  }

  void _sendEmail() async {
    final serviceId = dotenv.env['SEND_JS_SERVICE_ID']!;
    final templateId = dotenv.env['SENDJS_TEMPLATE_ID']!;
    final userId = dotenv.env['SENDJS_USER_ID']!;
    final token = dotenv.env['SENDJS_TOKEN']!;

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'accessToken': token,
        'template_params': {
          'user_name': _nameController.text,
          'user_email': _emailController.text,
          'user_message': _messageController.text,
        },
      }),
    );

    if (response.statusCode == 200) {
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
      // Email sent successfully
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email sent successfully!'),
          padding: EdgeInsets.all(16.0),
          backgroundColor: Colors.greenAccent,
        ),
      );
    } else {
      // Failed to send email
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to send email. Please try again later.'),
          padding: EdgeInsets.all(16.0),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
