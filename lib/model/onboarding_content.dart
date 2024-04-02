class OnBoardingContent {
  final String title;
  final String image;
  final String? description;

  OnBoardingContent(
      {required this.title, required this.image, this.description});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
    title: 'Selamat datang di Catatmak!',
    image: 'assets/images/catatmak_onboarding_ilustration_1.png',
    description:
        'Aplikasi yang bikin pencatatan keuanganmu lebih mudah. Siap analisa keuanganmu dengan bantuan prediksi dari ai',
  ),
  OnBoardingContent(
    title: 'Catat Keuangan Mudah Langsung Terhubung dengan Whatsapp',
    image: 'assets/images/catatmak_onboarding_ilustration_1.png',
  ),
  OnBoardingContent(
    title:
        'Dapatkan Analisa Keuangan by Mamih AI yang Langsung Terkirim Lewat Whatsapp Setiap Minggu',
    image: 'assets/images/catatmak_onboarding_ilustration_1.png',
  ),
];
