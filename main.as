#include "Player.as"

ModelGroup platforms, obstacles;
Player@ player;
Model@ goal;
Clock clock;

void Start()
{
	Game::manageCameraMovement = false;

	platforms = Game::scene.GetModelGroup("platforms");
	obstacles = Game::scene.GetModelGroup("obstacles");
	@player = @Player(Game::scene.GetModel("player"), 12.0, 200.0);
	@goal = @Game::scene.GetModel("goal");
}

void Loop()
{
	goal.Rotate(QuaternionFromEuler(Vector3(0.05, 0.05, 0.05)));

	player.Move(platforms, obstacles, @goal);
}
