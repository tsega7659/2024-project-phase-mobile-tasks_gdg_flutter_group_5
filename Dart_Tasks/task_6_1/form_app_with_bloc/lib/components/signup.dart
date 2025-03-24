import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:form_app_with_bloc/components/bloc_email/email_bloc.dart";
import "package:form_app_with_bloc/components/bloc_email/email_event.dart";
import "package:form_app_with_bloc/components/bloc_email/email_state.dart"; // Import EmailState
import "./bloc_password_visiblity/bloc/password_visiblity_bloc.dart";
import "./bloc_password_visiblity/bloc/password_visiblity_event.dart";
import "./bloc_password_visiblity/bloc/password_visiblity_state.dart";

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PasswordVisiblityBloc()),
        BlocProvider(create: (context) => EmailBloc()), // Provide EmailBloc
      ],
      child: SignupScreen(),
    );
  }
}

class SignupScreen extends StatelessWidget {
  final TextEditingController emailController =
      TextEditingController(); // Capture Email Input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 10),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 10, right: 30),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: emailController, // Store input email
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    BlocBuilder<PasswordVisiblityBloc, PasswordVisiblityState>(
                      builder: (context, state) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 232, 226, 226),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            obscureText: !state.isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  state.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  context
                                      .read<PasswordVisiblityBloc>()
                                      .add(TogglePasswordVisiblity());
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<EmailBloc>().add(DisplayEmailEvent(
                              emailController.text)); // Pass email text
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.all(20)),
                      ),
                    ),
                    SizedBox(height: 20),

                    /// 🔹 Display the Email Below Sign-Up Button
                    BlocBuilder<EmailBloc, EmailState>(
                      builder: (context, state) {
                        return Text(
                          "Entered Email: ${state.email}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        );

                        // return Container(); // If no email, show nothing
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
