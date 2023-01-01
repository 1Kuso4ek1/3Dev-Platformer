#include "Player.as"

ShapeGroup platforms, obstacles;
Player@ player;
Shape@ goal;
Clock clock;

void Start()
{
	Game::manageCameraMovement = false;

	platforms = Game::scene.GetShapeGroup("platforms");
	obstacles = Game::scene.GetShapeGroup("obstacles");
	@player = @Player(Game::scene.GetShape("player"), 10.0, 400.0);
	@goal = @Game::scene.GetShape("goal");
}

void Loop()
{
	goal.Rotate(QuaternionFromEuler(Vector3(0.05, 0.05, 0.05)));

	player.Move(platforms, obstacles, @goal);
}
