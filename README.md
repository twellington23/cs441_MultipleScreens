# cs441_MultipleScreens
This project is meant to be a game that implements a use of multiple screens.

This game was inspired by reaction testing games. Upon starting the game, two buttons will appear on the screen: a red button and a blue button. The buttons will randomly appear in one of two positions. Tapping the blue button gives the player a point, but tapping the red button means the player loses. In addition to this, if the player does not push the blue button quick enough, they lose. The goal of the game is to see how many points the player can get before hitting the red button or being too slow.

In addition to the blue and red buttons, the player's current score is displayed on the top of the screen, as well as an "Instructions" button on the button. Tapping the "Instructions" button brings up the instruction screen which displays the rules of the game. This also resets the game, setting the score back to zero. 

The game continues as long as the player is able to quickly tap the blue button. When the player loses, either by pressing the red button or being too slow, the game pulls up the instructions screen and resets the player's score to zero.
