import 'package:intl/intl.dart';

var onlyDate = DateFormat("dd-MM-yy"); // 20-04-23
var date = DateFormat.yMd(); // 7/10/2020
var monthNameDate = DateFormat.yMMMMd('en_US'); // July 10, 1996
var dayMonthYear = DateFormat.yMMMEd(); // Fri, Apr 3, 2020
var onlyDay = DateFormat('EEEE'); // Sunday
var onlyDayThree = DateFormat('EEE');
var onlyTime = DateFormat('h:mm a'); // 10:10 AM
var dateAndTime = DateFormat.yMd().add_jm(); // 7/10/1996 5:08 PM
var onlyHrs = DateFormat.Hm(); // 17:08
var onlyMonth = DateFormat("MMMM"); // March
var monthYear = DateFormat("yMMM"); // Apr 2022
var dayMonth = DateFormat('EEEE, dd MMMM'); // Sunday, 07 July
var chatDate = DateFormat('dd/MM, h:mm a'); // 07/07, 10:10 AM

