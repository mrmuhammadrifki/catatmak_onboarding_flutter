import 'package:catatmak/config/themes/base_color.dart';
import 'package:flutter/material.dart';

class VerificationSuccess extends StatelessWidget {
  const VerificationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 92),
          child: Column(
            children: [
              const Text(
                'Selamat datang di Catatmak',
                style: TextStyle(
                  color: BaseColor.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                textAlign: TextAlign.justify,
                'Yuk mulai catat kondisi finansialmu untuk masa depan keuangan yang lebih baik!',
                style: TextStyle(
                  color: BaseColor.black,
                  fontSize: 16,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 66),
              Image.asset('assets/images/ilustration.png'),
            ],
          ),
        ),
      ),
    );
  }
}
