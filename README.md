# Flappy Bird Clone

This project is an implementation of the Flappy Bird game as part of the [20 Games Challenge](https://20_games_challenge.gitlab.io/games/flappy/).

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
- [ ] Add some background art! Try layering the background and scrolling at a different rate to the foreground obstacles. This is called Parallax scrolling.

## How to Run

1. Clone the repository.
2. Open the project in [Godot 4.3](https://godotengine.org/download/archive/4.3-stable/).
3. Press the play button in the Godot editor to run the game.

## License

This project is licensed under the MIT License.
