
import '../modules/dashboard/chat/ChatInbox.dart';
import '../modules/dashboard/chat/chatting/chat-meassage.dart';

class Datas {
  final List<String> dropdownItems = ['+241', '+91', '+1'];
  static const String withdrawTax = '7%';
  static const String pin = '1234';
  static const String cashIn =
      "Increase Your Balance: Effortlessly Cash In to Boost Your Wallet!";
  static const String cashOut =
      "Unlock Your Funds: Seamlessly Cash Out and Empower Your Finances!";
  static const String cashInWarning =
      "Please note that a service charge will be applied during cash out to cover processing costs.";
  List paymentList = [
    {'title': 'Mobile\nRecharge', 'image': 'assets/icons/mobile-recharge.png'},
    {'title': 'Water Bill', 'image': 'assets/icons/watter-bill.png'},
    {
      'title': 'Electricity\nBill',
      'image': 'assets/icons/electricity-bill.png'
    },
    {'title': 'Ticket\nBooking', 'image': 'assets/icons/voucher.png'},
    // {'title': 'Card Card\nBill', 'image': 'assets/icons/credit-card.png'},
    // {'title': 'Movies', 'image': 'assets/icons/movie-booking.png'},
    // {'title': 'Flights', 'image': 'assets/icons/flight.png'},
    // {'title': 'More', 'image': 'assets/icons/more.png'}
  ];
  List mailOption = [
    {'title': 'Add Funds', 'image': 'assets/icons/add-funds.png'},
    {'title': 'Send', 'image': 'assets/icons/send-money.png'},
    {'title': 'Request', 'image': 'assets/icons/receive-money.png'},
    {'title': 'Withdraw', 'image': 'assets/icons/withdraw-funds.png'}
  ];
  List category = [
    'Merchant Payments',
    'Refunds',
    'Money Received',
    'Money Sent',
    'Watter Bill',
    'Mobile Recharge',
    'Electricity BIll'
  ];
  List filterPaymentMethod = ['Wallet', 'Credit/Debit Card'];
  List filterStatus = ['Failed', 'Pending', 'Successful'];

  var qr = {
    "company": "51Cash",
    "userName": "userName",
    "name": "Shivay Kumar",
    "user_id": "859465258",
  };

  Map<String, dynamic> termsAndConditions = {
    'title': "Terms and Conditions for Cash In and Cash Out Services",
    'conclusion':
        "By using our cash-in and Cash Out services, you acknowledge and agree to abide by these terms and conditions. These terms and conditions are subject to change without prior notice, and it is recommended to review them periodically for any updates.",
    'sections': [
      {
        'title': "Cash In (Adding Funds):",
        'subTitle': [
          "Adding funds to your wallet from credit cards, debit cards, or net banking is free of charge.",
          "The availability of this service is subject to the terms and conditions of your chosen payment method providers.",
          "We are not responsible for any fees or charges imposed by your payment method provider during the cash-in process."
        ]
      },
      {
        'title': "Cash Out (Withdrawal of Funds)",
        'subTitle': [
          "While adding funds to your wallet is free, withdrawing funds (Cash Out) from your wallet will incur a service charge known as $withdrawTax, which is a percentage of the withdrawal amount.",
          "The $withdrawTax withdrawal tax may vary from time to time, and any changes will be communicated to users through our official communication channels.",
          "The withdrawal tax will be deducted from the withdrawal (Cash Out) amount before the funds are transferred to your designated bank account.",
          "The availability of the Cash Out service is subject to the terms and conditions of your designated bank and payment method providers.",
          "We are not responsible for any fees or charges imposed by your bank or payment method provider during the Cash Out process."
        ]
      },
      {
        'title': "Service Charge and Tax Changes",
        'subTitle': [
          "We reserve the right to modify the $withdrawTax withdrawal tax and any other applicable fees or charges at our discretion.",
          "Any changes to the withdrawal tax will be updated on our platform and communicated to users in advance through our official communication channels."
        ]
      },
      {
        'title': "Liability and Refunds:",
        'subTitle': [
          "We are not liable for any loss of funds, unauthorized transactions, or any other issues arising from the use of our cash-in and Cash Out services.",
          "Users are responsible for ensuring the accuracy of the withdrawal details provided.",
          "Refunds for withdrawal tax charges will not be provided unless there is a demonstrable error on our part."
        ]
      },
      {
        'title': "User Responsibility:",
        'subTitle': [
          "Users must adhere to all applicable laws and regulations while using our cash-in and Cash Out services.",
          "Users are responsible for maintaining the security and confidentiality of their account credentials and payment details."
        ]
      }
    ]
  };
  final List<ChatMessage> messages = [
    ChatMessage(
      messageContent: "450",
      messageType: "sender",
      isMedia: false,
      time: DateTime.now().subtract(Duration(minutes: 1)),
      isSeen: false,
      sendMoney: true,
      requestMoney: false,
    ),
    ChatMessage(
      messageContent: "354",
      messageType: "receiver",
      isMedia: false,
      time: DateTime.now().subtract(Duration(minutes: 30)),
      isSeen: false,
      sendMoney: true,
      requestMoney: false,
    ),
    ChatMessage(
      messageContent: "748",
      messageType: "receiver",
      isMedia: true,
      time: DateTime.now().subtract(Duration(minutes: 25)),
      isSeen: false,
      sendMoney: false,
      requestMoney: true,
    ),
    ChatMessage(
      messageContent: "748",
      messageType: "receiver",
      isMedia: false,
      time: DateTime.now().subtract(Duration(minutes: 25)),
      isSeen: false,
      sendMoney: false,
      requestMoney: true,
    ),
    ChatMessage(
      messageContent: "8888",
      messageType: "sender",
      isMedia: false,
      time: DateTime.now().subtract(Duration(minutes: 20)),
      isSeen: false,
      sendMoney: false,
      requestMoney: true,
    ),
    ChatMessage(
      messageContent: "7777",
      messageType: "sender",
      isMedia: true,
      time: DateTime.now().subtract(Duration(minutes: 20)),
      isSeen: false,
      sendMoney: false,
      requestMoney: true,
    ),
    ChatMessage(
      messageContent: "ehhhh, doing OK.",
      messageType: "receiver",
      isMedia: false,
      time: DateTime.now().subtract(const Duration(minutes: 15)),
      isSeen: false,
      sendMoney: false,
      requestMoney: false,
    ),
    ChatMessage(
      messageContent: "Is there anything wrong?",
      messageType: "sender",
      isMedia: false,
      time: DateTime.now().subtract(Duration(minutes: 10)),
      isSeen: false,
      sendMoney: false,
      requestMoney: false,
    ),
    // ... (continue with the rest of the messages)
    // ... (previous messages)
    ChatMessage(
      messageContent: "This is message 7",
      messageType: "sender",
      isMedia: false,
      time: DateTime.now().subtract(Duration(minutes: 8)),
      isSeen: false,
      sendMoney: false,
      requestMoney: false,
    ),
    ChatMessage(
      messageContent: "4587",
      messageType: "receiver",
      isMedia: false,
      time: DateTime.now().subtract(Duration(minutes: 7)),
      isSeen: false,
      sendMoney: false,
      requestMoney: true,
    ),
    ChatMessage(
      messageContent: "1111",
      messageType: "receiver",
      isMedia: true,
      time: DateTime.now().subtract(Duration(minutes: 7)),
      isSeen: false,
      sendMoney: false,
      requestMoney: true,
    ),
    ChatMessage(
      messageContent: "Message 30",
      messageType: "receiver",
      isMedia: false,
      time: DateTime.now().subtract(Duration(minutes: 1)),
      isSeen: false,
      sendMoney: false,
      requestMoney: false,
    ),

// ... (add more messages with the same pattern)
  ];
}
