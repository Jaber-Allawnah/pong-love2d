# Pong Game — LÖVE2D

## Student Information

- **Full Name:** Jaber Alawna
- **Section:** Mon - Wed (8:00 - 10:00)
- **Course:** AI in Games

## Project Description

This project is a two-player Pong game developed using **Lua** and the **LÖVE2D framework**.

The game includes two player-controlled paddles, a moving ball, collision detection, and a scoring system. Players must move their paddles to prevent the ball from passing their side of the screen.

The game also includes a main menu and a pause/resume feature.

## How to Run the Game

1. Install LÖVE2D from [https://love2d.org/](https://love2d.org/).
2. Clone this repository:

   ```bash
   git clone https://github.com/USERNAME/pong-love2d.git
   ```

3. Open the `pong-love2d` project folder.
4. Run the game by dragging the project folder onto the LÖVE executable or by running:

   ```bash
   love .
   ```

## Game Controls

| Key | Action |
|---|---|
| W | Move Player 1 up |
| S | Move Player 1 down |
| Up Arrow | Move Player 2 up |
| Down Arrow | Move Player 2 down |
| Enter | Start the game |
| P | Pause or resume the game |

## Game Features

- Two-player paddle movement with screen boundaries.
- Ball movement using horizontal and vertical velocity.
- Ball bouncing off the top and bottom walls.
- AABB collision detection between the ball and paddles.
- Automatic scoring when a player misses the ball.
- Ball reset to the center after scoring.
- Score display for both players.

## Additional Feature — Main Menu and Pause/Resume

I implemented a **game-state system** with three states:

- **Menu:** Displays the game title and instructions to start.
- **Play:** Runs the game normally.
- **Pause:** Freezes the game while keeping the current positions and scores visible.

Players can press **Enter** to start and **P** to pause or resume without losing their progress.

## Screenshots

### Main Menu

![Main Menu](screenshots/Main%20Menu.png)

### Gameplay and Scoring

![Gameplay and Scoring](screenshots/Score%20Change.png)

### Pause Menu

![Pause Menu](screenshots/Pause%20Menu.png)

## Demo Video

[Watch the Pong Game Demo](demo/pong-demo.mp4)

The demo demonstrates the main menu, paddle controls, ball movement, scoring, and pause/resume functionality.

## Technologies Used

- **Lua** — Programming language
- **LÖVE2D** — 2D game development framework
- **Git and GitHub** — Version control and project hosting
