import 'package:flutter/material.dart';
import 'package:meet_me/login.dart';

class OnBoardingPages extends StatefulWidget {
  const OnBoardingPages({Key? key}) : super(key: key);

  @override
  State<OnBoardingPages> createState() => _OnBoardingPagesState();
}

class _OnBoardingPagesState extends State<OnBoardingPages> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 200,
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => OnBoardCcomponet(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text("Login")),
                  ),
                  SizedBox(
                    height: 60,
                    width: 180,
                    child: TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                              curve: Curves.ease,
                              duration: Duration(microseconds: 300));
                        },
                        child: const Text("Next")),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> demo_data = [
  Onboard(
      image: "assets/meetingHall.png",
      title: "Manage your Meeting Here",
      description:
          "Meeting Manager is SharePoint application that \n allows you to manage meetings for day,\n it also allows to set Agenda for meeting."),
  Onboard(
      image: "assets/meeting2.png",
      title: "Add Your Meeting Members",
      description:
          "The main feature for any membership management \n application should be to provide any organization with the \n necessary tools to organize and track membership information."),
  Onboard(
      image: "assets/meet3.png",
      title: "Add Your Meetng Location",
      description:
          "A Meeting Room Booking System for companies \n to effectively utilize their meeting rooms and \n convert their offices into hybrid workplaces"),
];

class OnBoardCcomponet extends StatelessWidget {
  const OnBoardCcomponet({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 300,
        ),
        // const Spacer(),
        SizedBox(
          height: 80,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
