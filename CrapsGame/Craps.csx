// Game Craps
////import java.util.Scanner;
////import java.text.DecimalFormat;
////import java.util.Random;

////Scanner keyboard = new Scanner(System.in);
////DecimalFormat percent = new DecimalFormat("0.0%");
double probWin;
int numberGames, numberWins, dice1, dice2, totalRoll;

Console.WriteLine("PROBABIITY OF WINNING AT CRAPS\n");          ////System.out.println("PROBABIITY OF WINNING AT CRAPS\n");
Console.WriteLine("Enter number of games to play: ");       ////System.out.println("Enter number of games to play:");

numberGames = 0;
var input = Console.ReadLine();
int.TryParse(input, out numberGames);                       ////numberGames = keyboard.nextInt();

if(numberGames < 1)
    Console.WriteLine("Must enter a positive integer number."); // System.out.println("Must enter a positive integer number\n");

//NEED HELP ON THIS LOOP
numberWins = 0;
for (int game = 1; game <= numberGames; game++)
{
    int comeOutRoll = RollDice();
    Outcome result = ValidateRoll(comeOutRoll);

    if (result == Outcome.Win)
    {
        numberWins++;
        // Console.WriteLine("Outcome: Winner!");
    }
    else if (result == Outcome.TryAgain)
    {
        bool rollAgain = false;
        do
        {
            comeOutRoll += RollDice();
            var retryResult = ValidateRoll(comeOutRoll);

            if (retryResult == Outcome.Win)
                numberWins++;

            // KEY: Didn't roll over 12
            rollAgain = (retryResult == Outcome.TryAgain && comeOutRoll <= 12);
            // Console.WriteLine($"Retry Outcome: {retryResult} - {comeOutRoll}");
        } while (rollAgain);
    }
    else
    {
        // Do nothing, you loose.
        //Console.WriteLine("Outcome: Looser!");
    }
}

probWin = ((double)numberWins / numberGames) * 100;                                     ////probWin = ((double)numberWins) / numberGames;
Console.WriteLine($"Probability of winning is {probWin.ToString("0.0")}%");     ////System.out.println("\nProbability of winning is " + percent.format(probWin));

public enum Outcome
{
    Win,
    Loose,
    TryAgain,
}

public int RollDice()
{
    Random randomGenerator = new Random();
    int dice1 = randomGenerator.Next(6) + 1;    //randomGenerator.nextInt(6) + 1;
    int dice2 = randomGenerator.Next(6) + 1;    //randomGenerator.nextInt(6) + 1;
    return dice1 + dice2;
}

public Outcome ValidateRoll(int value)
{
    if (value == 7 || value == 11)
        return Outcome.Win;
    else if (value == 2 || value == 3 || value == 12)
        return Outcome.Loose;
    else
        return Outcome.TryAgain;
}
