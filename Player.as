class Player
{
	Player(Shape@ body, float speed, float jumpForce)
	{
		this.startPos = body.GetPosition();
		@this.body = @body;
		this.speed = speed;
		this.jumpForce = jumpForce;
	}

	void Move(ShapeGroup& in platforms, ShapeGroup& in obstacles, Shape@ goal)
	{
		body.SetOrientation(Quaternion(0.0, 0.0, 0.0, 1.0));
		
		for(uint i = 0; i < platforms.Size(); i++)
		{
			if(body.GetRigidBody().testAABBOverlap(platforms[i].GetRigidBody().getAABB()))
				if(Keyboard::isKeyPressed(Keyboard::Space))
					body.GetRigidBody().applyWorldForceAtCenterOfMass(Vector3(0.0, jumpForce, 0.0));
		}

		Vector3 move = Game::camera.Move(speed);
		move.y = body.GetRigidBody().getLinearVelocity().y;

		body.GetRigidBody().setLinearVelocity(move);
		Game::camera.SetPosition(body.GetPosition() + Vector3(0.0, body.GetSize().y, 0.0));

		for(uint i = 0; i < obstacles.Size(); i++)
		{
			if(body.GetRigidBody().testAABBOverlap(obstacles[i].GetRigidBody().getAABB()))
			{
				body.SetPosition(startPos);
				body.GetRigidBody().setLinearVelocity(Vector3(0.0, 0.0, 0.0));
				Log::Write("You died!");
			}
		}

		if(body.GetRigidBody().testAABBOverlap(goal.GetRigidBody().getAABB()))
		{
			body.SetPosition(startPos);
			body.GetRigidBody().setLinearVelocity(Vector3(0.0, 0.0, 0.0));
			Log::Write("You did it!");
		}
	}

	private Vector3 startPos;
	private float speed, jumpForce;
	private Shape@ body;
};
