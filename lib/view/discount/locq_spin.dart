import 'dart:async';
import 'widgets/back_light.dart';
import 'widgets/slot_machine.dart';
import 'widgets/animated_lever.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/animated_confetti.dart';
import 'package:locq/resources/functions.dart';
import 'package:locq/widgets/locq_widgets.dart';
import 'widgets/slot_machine_without_lever.dart';
import 'package:locq/view%20model/spin_viewmodel.dart';
import 'package:locq/view/discount/widgets/spin_button.dart';
import 'package:locq/view/discount/locq_daily_discount.dart';

class LocqSpin extends StatefulWidget {
  const LocqSpin({Key? key}) : super(key: key);

  @override
  State<LocqSpin> createState() => _LocqSpinState();
}

class _LocqSpinState extends State<LocqSpin> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final spinViewModel = Provider.of<SpinViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(children: [
        Numbers(left: 120),
        Numbers(left: 165),
        Numbers(left: 227),
        Numbers(left: 272),
        BackLight(),
        spinViewModel.leverLoading ? AnimatedLever() : SizedBox(),
        spinViewModel.slotMachineLoading ? SlotMachine() : SizedBox(),
        SlotMachineWithoutLever(),
        SpinButton(onTap: () {
          spinViewModel.showLever(true);
          Future.delayed(const Duration(seconds: 1),
              (() => spinViewModel.showSlotMachine(false)));
          Future.delayed(Duration(seconds: 2), () {
            spinViewModel.setLoading(true);
            spinViewModel.showConfetti(true);
            Timer mytimer = Timer.periodic(
                Duration(milliseconds: 100), (timer) => setState(() {}));
            Future.delayed(const Duration(seconds: 3),
                (() => spinViewModel.showSlotMachine(true)));
            Future.delayed(Duration(seconds: 3), (() => mytimer.cancel()));
          });
          Future.delayed(
              Duration(seconds: 6),
              () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DailyDicount(
                      discount: convertListToDouble(spinViewModel.discount)))));
        }),
        spinViewModel.confettiLoading ? AnimatedConfetti() : SizedBox(),
      ]),
    );
  }
}

// user may get a discount of 50 plus since I included all the numbers in the result.
// can modify to get desired results.

