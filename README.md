# Looney Bird

This project is an implementation of the Flappy Bird game as part of the [20 Games Challenge](https://20_games_challenge.gitlab.io/games/flappy/). You can play this game on [itch.io](https://snowfrog.itch.io/looney-bird).

## Implementation Goals

- [x] Create game world with a floor.
- [x] Add an object that represents the main character. Apply a constant force to the character so it falls to the floor.
- [x] Add obstacles on the right of the game area. The obstacles should slide across the screen toward the left. The obstacles will appear in pairs, with a vertical gap between them.
- [x] Detect when the character collides with the floor or obstacles, and reset the game when a collision occurs.
- [x] Accumulate one point for each obstacle that the player passes. Display the score.

### Stretch Goals

- [x] Add some sounds that will play each time the player gains a point, and when the player loses.
- [x] Add a basic game-over screen to display the player’s score.
- [x] Track the high-score between play sessions and display the high score alongside the current score.
- [x] Add some background art! Try layering the background and scrolling at a different rate to the foreground obstacles. This is called Parallax scrolling.

### Super Stretch Goals

- [x] Add music to the game.

### Time investment

All in all, I spent a total of 50 hours on this project. This includes time spent on research, coding, making the art assets, animations, music, sound effects and releasing on [itch.io](https://snowfrog.itch.io/looney-bird). Going in, I was relatively new to [Godot](https://godotengine.org/) and completely new to making art and music. I used [Krita](https://krita.org/en/) for the art and animation and I used [FL Studio](https://www.image-line.com/fl-studio/) for the music. Both software were new to me. I expect that if I was to do this again, it would probably take me half the time.

## How to Run

1. Clone the repository.
2. Open the project in [Godot 4.4](https://godotengine.org/download/archive/4.4-stable/).
3. Press the play button in the Godot editor to run the game.

## License

This project is licensed under the MIT License.
