; Fraps - Craps for Flat Assembler
; Problem:
;   Using the rules of Craps, determin the probability of a player
;   winning an individual game.
; Rules:
;   1) 2 Dice are thrown randomly, each producing a value between 1 and 6.
;   2) 1st roll ("Come Out"): If combined value is 7 or 11, player wins; game over.
;   3) If combined value is 2, 3, or 12, the player loses; game over.
;   4) If not a win/loss, the value of the dice becomes the "Point" value.
;      Keep rolling the pair until their combined value matches the
;      "point" (win; game over) or a 7 (loss; game over).
;
; Input:
;   * "Number of games to be played" (must be >= 1)
; Output:
;   * Average percentage (whole number) that the player
;     wins an individual games of craps.
;

;format PE GUI 4.0
format PE console
entry start

include 'WIN32A.INC'


section '.text' code readable executable
start:
        push _welcome
        call [printf]
        pop ecx

        call [scanf]

        push 0
        call [ExitProcess]

RollDice:
        push ecx edx


section '.rdata' data readable writeable

  _welcome db 'Lets play a game of Craps!', 10, 0
  _inputMsg db 'Number of games to be played: ', 0
  _output  db 'Average % of wins: ', 0

section '.idata' data readable import
  library kernel32, 'kernel32.dll', \
          msvcrt,   'msvcrt.dll'

  import kernel32, \
         ExitProcess, 'ExitProcess'

  import msvcrt, \
         printf, 'printf', \
         scanf, 'scanf'
