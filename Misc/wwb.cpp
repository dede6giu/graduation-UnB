/*

code by dede6giu

W.W.B is the self-proclaimed "World's Worst Boardgame"
It consists of three simple rules:
    1. On each player's turn, the player gets to roll a die. If the 
    result is 5, they get to move one space forward.
    2. After rolling a 5, the player MUST roll again. If they do not
    roll another 5, they will be sent back to start.
    3. If a player moves onto a space occupied by another player, the
    player that was standing on that space gets sent to the start.
The issue is, the board has numbered spaces from 1-100, and two extra
spaces: start and finish.

Some things about this program:
    - It will run indefinitely (rather, to the heat death of the
    universe). This WILL eventually crash whatever you put it on.
    - It will broadcast every time some player reaches a new furthest
    space. Amount of turns will also be displayed, a turn defined as
    one complete player action. It will also display how many rounds
    there has been, one full round completed after each player has
    had their turn.

*/

#include <bits/stdc++.h>
using namespace std;

class bad_const : public exception { 
private: 
    string message;
public: 
    bad_const(const char* msg) : message(msg) {}
    
    const char* what() const throw() { 
        return message.c_str(); 
    } 
}; 

bool player_turn(
vector<int>& positions,
int player,
int faces,
long long int& die,
long long int& restart
) {
    int roll = rand() % faces; die++;
    if (roll != 0) {
        return false;
    }
    positions[player] += 1;
    roll = rand() % faces; die++;
    if (roll != 0) {
        positions[player] = 0;
        restart++;
    }
    return true;
}

void elimination(vector<int>& positions, int amount, int player, long long int& elim) {
    int space = positions[player];

    if (space == 0) {
        return;
    }

    for (int i = 0; i < amount; i++) {
        if (i == player) {
            continue;
        }
        if (positions[i] == space) {
            positions[i] = 0;
            elim++;
        }
    }
}

bool win_condition(int win, int current) {
    if (win == current) {
        return false;
    }
    return true;
}

string time_format(int seconds) {
    string result = "";
    result += to_string(seconds / 3600);
    result += ":";
    seconds -= (seconds / 3600) * 3600;
    result += to_string(seconds / 60);
    result += ":";
    seconds -= (seconds / 60) * 60;
    result += to_string(seconds);
    return result;
}

void highscore(
vector<int>& positions,
int player,
int& currentBig,
long long int& turn,
long long int& die,
chrono::steady_clock::time_point begin
) {
    if (positions[player] > currentBig) {
        chrono::steady_clock::time_point end = chrono::steady_clock::now();
        string time = time_format(chrono::duration_cast<std::chrono::seconds>(end - begin).count());

        currentBig++;
        cout << "=======================\n";
        cout << "A new high has been achieved!\n" <<
        "Player " << player + 1 << " has reached space " << currentBig << "!\n" <<
        "It took " << turn << " turns to achieve it.\n" <<
        "There has been " << turn / positions.size() << " rounds.\n" <<
        "Exactly " << die << " die have been rolled.\n" <<
        "The program has been running for " << time << ".\n";
    }
}

void win(
vector<int>& positions, 
int player, 
long long int& turn, 
long long int& die, 
long long int& elim, 
long long int& restart, 
chrono::steady_clock::time_point begin
) {
    chrono::steady_clock::time_point end = chrono::steady_clock::now();
    string time = time_format(chrono::duration_cast<std::chrono::seconds>(end - begin).count());

    cout << "=======================\n";
    cout << "The game has finished!\n" << "Here are the stats:\n" <<
    "Time taken:     " << time << "\n" <<
    "Turns taken:    " << turn << "\n"
    "Rounds taken:   " << turn / positions.size() << "\n" <<
    "Restarts:       " << restart << "\n" <<
    "Eliminations:   " << elim << "\n" <<
    "Winning player: " << player + 1 << "\n" <<
    "Die rolled:     " << die << "\n";
}

int main() {
    // game variables
    bool gameRun = true, positionChange = false;
    int playerCurrent, biggestSpace;
    long long int turn = 0;
    vector<int> playerPositions;

    // game constants
    const int DIE_FACES = 6;      //  (6)  // how many faces in the die
    const int WIN_POSITION = 101; // (101) // how many spaces there are in the board
    const int PLAYER_AMNT = 4;    //  (4)  // how many players are playing
    const chrono::steady_clock::time_point start = chrono::steady_clock::now(); // time measurement

    //stat variables
    long long int dieRolled = 0;
    long long int elimAmnt = 0;
    long long int restartAmnt = 0;

    // checks constants to see if they're correctly set
    if (DIE_FACES <= 0) {
        throw bad_const("die must have at least 1 face");
    }
    if (WIN_POSITION <= 0) {
        throw bad_const("board must have at least 1 space");
    }
    if (PLAYER_AMNT <= 0) {
        throw bad_const("game must have at least 1 player");
    }

    // initialize every player
    for (int i = 0; i < PLAYER_AMNT; i++) {
        playerPositions.push_back(0);
    }

    // code will run until the game finishes, the loop is equal to one turn
    playerCurrent = -1;
    biggestSpace = 0;
    positionChange = false;
    while (gameRun) {
        // turn change
        turn++;
        if (playerCurrent < PLAYER_AMNT - 1) {
            playerCurrent++;
        } else {
            playerCurrent = 0;
        }

        // player rolls die according to rules 1 and 2
        positionChange = player_turn(playerPositions, playerCurrent, DIE_FACES, dieRolled, restartAmnt);

        if (positionChange) {
            // elimination process according to rule 3
            elimination(playerPositions, PLAYER_AMNT, playerCurrent, elimAmnt);

            // highscore check
            highscore(playerPositions, playerCurrent, biggestSpace, turn, dieRolled, start);
            
            // win condition
            gameRun = win_condition(WIN_POSITION, playerPositions[playerCurrent]);

            positionChange = false;
        }
    }

    win(playerPositions, playerCurrent, turn, dieRolled, elimAmnt, restartAmnt, start);

    return 0;
}