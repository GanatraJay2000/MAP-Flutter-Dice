import 'package:flutter/material.dart';
import 'package:dice_game/widgets/custom_button.dart';
import 'package:dice_game/widgets/alert_dialog.dart';

class AuthorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Author'),
      ),
      body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Jay Ganatra',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/myPhoto.jpg'),
              ),
            ),
            SizedBox(height: 10),
            Text('App Developer'),
            SizedBox(height: 10),
            Text('CGPA: 3.8', style: TextStyle(fontStyle: FontStyle.italic,)),
            SizedBox(height: 10),
            Text('Current Course: CIS 651: Mobile Appln Prog.'),
            SizedBox(height: 20),
            CustomButton(
              text: 'Contact Me',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertDialog(
                      title: 'Contact',
                      content: 'You can reach me at jganatra@syr.edu',
                      onDismissed: () {},
                    );
                  },
                );
              },
            ),
            Spacer(),
            CustomButton(
              text: 'Back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
