import 'package:catatmak/config/themes/base_color.dart';
import 'package:catatmak/pages/verification.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_checkInput);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _checkInput() {
    setState(() {
      _isButtonEnabled = _phoneController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 50,
            left: 16,
            right: 16,
            bottom: 32,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/catatmak_with_bg_small.png',
                      height: 89,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Masukan Nomor Whatsapp',
                      style: TextStyle(
                        color: BaseColor.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Kode verifikasi akan dikirimkan langsung ke nomor whatsapp kamu.',
                      style: TextStyle(
                        color: BaseColor.black,
                        fontSize: 14,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/country_code.png',
                          height: 25,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              color: BaseColor.black,
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              height: 1.19,
                            ),
                            decoration: const InputDecoration(
                              hintText: '85741892603',
                              hintStyle: TextStyle(
                                  color: BaseColor.inputNonFocusColor),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: BaseColor.inputNonFocusColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: BaseColor.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Dengan Mendaftar Kamu, ',
                            style: TextStyle(
                              color: BaseColor.black,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'Setujui Syarat dan Ketentuan',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Verification();
                            },
                          ));
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: _isButtonEnabled
                          ? BaseColor.darkBlue
                          : BaseColor.inputNonFocusColor,
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                  child: const Text('LANJUT'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
