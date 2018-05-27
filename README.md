# PitchPerfect

An app which allows the user to record their voice and add sound effects to the recording.

## User Guide

1. Click the record button to begin recording your audio.
2. Once you have done this click the stop button.
3. This will take you to the effect page. Select the sound effects you want to play your recordings with.
4. Once you have selected the effects, click play.
5. If you wish to clear the effects, click the stop button.
6. If you want to create a new recording, click the back button.

## Notes to assessor

I have added some extra buttons to further enhance the functionality of Pitch Perfect. You can now:
*Play multiple effects at one time
*Speed up or slow down your audio to third speed or triple speed

Because these additional functions have been added, I have also added 3 extra buttons. Whilst building this app I disabled landscape mode because it makes viewing in landscape mode on an iPhone SE very squashed. I have enabled landscape mode as the grading guidelines request this, but i do hope I am not marked down on this.

## Requested advice

I have included a function to control the state of the effect buttons. Because I am enabling multi effects I had to write a function to keep some buttons enabled whilst also disabling the necessary buttons (for example, if the user clicks half speed, all of the other speed functions are disabled as half speed has been set).

I have tried to simplify the code and tried writing as a ternary operator but I keep getting error messages. If you could provide some advice or point me in the right direction to improve this this would be great.
