// ignore_for_file: file_names

import 'package:notary_ping/src/models/FAQsModel.dart';

import '../../../index.dart';

class ProfileState extends LoadingState {
  final RxString slectedCity = ''.obs;
  final RxBool isNotification = true.obs;
  final RxString countryCodee = '+33'.obs;
  final RxString groupValue = 'English'.obs;
  final RxList<String> allLanguages = [
    "English",
    "Spanish",
    "France",
  ].obs;
  final RxList<String> slectCountryCode = {
    '+33',
    '+91',
    '+92',
    '+241',
  }.toList().obs;

  ///dummy data
  final RxList<String> selecteCity = [
    'Peshawar',
    'Islamabad',
    'Lahore',
    'Karachi',
    'Quetta',
    'Multan',
    'Faisalabad',
    'Rawalpindi',
    'Sialkot',
    'Kalkata',
    'Mumbai',
    'Delhi',
    'Chennai',
    'Bangalore',
    'Hyderabad',
    'Ahmedabad',
    'Pune',
    'Surat',
    'Jaipur',
    'Kanpur',
    'Lucknow',
    'Nagpur',
    'Patna',
    'Indore',
    'Thane',
    'Bhopal',
    'Visakhapatnam',
    'Vadodara',
    'Firozabad',
    'Ludhiana',
    'Rajkot',
    'Agra',
    'Siliguri',
    'Nashik',
  ].obs;

  RxList<FAQsModel> filteredFAQS = [
    FAQsModel(
      question: 'How to change password?',
      answer:
          'You can change your password by going to the profile section and clicking on the change password option.',
      isShowAnswer: false,
    ),
    FAQsModel(
      question: 'Product not delivered?',
      answer:
          'You can he profile section and clicking on the change password option.',
      isShowAnswer: false,
    ),
    FAQsModel(
      question: 'How to change password?',
      answer:
          'You can change your password by going to the profile section and clicking on the change password option.',
      isShowAnswer: false,
    ),
  ].obs;

  RxList<String> languages = [
    'English',
    'Spanish',
    'French',
    // Add more languages as needed
  ].obs;

  RxList<String> selectPrimesCategores1 = [
    'Electronics',
    'Mobile Accessories',
    'Clothing',
    'Home Appliances',
    'Books',
    'Toys',
    'Furniture',
    'Beauty and Personal Care',
    'Sports and Outdoors',
    'Automotive',
  ].obs;
}
