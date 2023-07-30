import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'package:truthordare/providers/player_info_provider.dart';
import 'package:truthordare/providers/screen_provider.dart';
import 'package:truthordare/settings/game_settings.dart';
import 'package:truthordare/settings/players_info.dart';
import 'package:truthordare/theme/app_consts.dart';
import 'package:truthordare/theme/app_gradients.dart';
import 'package:truthordare/theme/app_styles.dart';
import 'package:truthordare/utils/app_layout.dart';
import 'package:truthordare/widgets/buttons/fat_buttons.dart';
import 'package:truthordare/widgets/cards/stacked_cards.dart';
import 'package:truthordare/widgets/stylish/gradient_stack.dart';
import 'package:truthordare/widgets/stylish/horizontal_line.dart';
import 'package:truthordare/widgets/text_input_button.dart';

class PlayerDetailsScreen extends StatelessWidget {
  final _pProvider = Provider.of<PlayerInfoProvider>;
  final _sProvider = Provider.of<ScreenProvider>;
  const PlayerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientStack(
      gradients: AppGradients.mainScreenBG,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StackedCards(
                repeat: 3,
                cardHeight: AppLayout.getHeightPercent(58),
                cardWidth: AppLayout.getWidth(AppConsts.cardWidth),
                gap: -4,
                scaleFactor: 0.1,
                darken: false,
                gradients: const [AppGradients.playerInfoBG2],
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  shrinkWrap: true,
                  children: [
                    //? --------------------------------- Inputs Feilds ---------------------------------
                    Column(
                      children: [
                        //? ------------------------------- Total Players -------------------------------
                        Text(
                          'Total Players',
                          style: AppStyles.cardSubtitle.copyWith(fontSize: 30),
                        ),
                        const HorizontalLine(),
                        const Gap(10),

                        //? ---------------------------- Total Players Input ----------------------------
                        TextInputButton(
                          text: _pProvider(context).totalPlayers.toString(),
                          title: 'Enter total no. of players',
                          isAlphaNumeric: false,
                          maxNumValue: GameSettings.maxPlayers,
                          minNumValue: GameSettings.minPlayers,
                          onDone: (text) {
                            if (text.isNotEmpty) {
                              _pProvider(context, listen: false)
                                  .updateTotalPlayers(int.tryParse(text) ?? PlayersInfo.totalPlayers);
                            }
                          },
                        ),
                        const Gap(35),

                        //? ------------------------------- Player's Name -------------------------------
                        Text(
                          'Player\'s Name',
                          style: AppStyles.cardSubtitle.copyWith(fontSize: 30),
                        ),
                        const HorizontalLine(),
                        const Gap(10),

                        //? ---------------------------- Player's Name Input ----------------------------
                        ...addPlayerFields(context),
                      ],
                    ),
                  ],
                ),
              ),

              //? ---------------------------------- Start Game Button ----------------------------------
              FatButton(
                text: 'Start The Game!',
                width: AppConsts.inputButtonWidth,
                gradient: AppGradients.inputFeild,
                onTap: () {
                  _sProvider(context, listen: false).changeBottomNavScreen(1);
                  PlayersInfo.randomPlayer;
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> addPlayerFields(BuildContext context) {
    List<Widget> list = [];
    int totalPlayers = _pProvider(context).totalPlayers;

    for (int index = 0; index < totalPlayers; index++) {
      list.add(
        TextInputButton(
          text: _pProvider(context).players[index].toString(),
          title: 'Enter player 1\'s name'.toUpperCase(),
          onDone: (name) {
            if (name.isNotEmpty) {
              _pProvider(context, listen: false).updatePlayerName(name, index);
            }
          },
        ),
      );
      list.add(const Gap(20));
    }
    return list;
  }
}
