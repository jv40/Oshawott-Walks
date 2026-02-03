extends CharacterBody2D
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 200.0
#const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	## Handle jump.
	#if Input.is_action_just_pressed("move_up") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("move_left", "move_right")
	var y_direction := Input.get_axis("move_up", "move_down")
	
	#anim_sprite.play("walk_down")
	
	#This is some very piecemeal code. The movement is slightly cooked
	if x_direction && !y_direction:
		velocity.x = x_direction * SPEED
		anim_sprite.play("walk_side")
		
		if x_direction == 1:
			anim_sprite.flip_h = true
		else:
			anim_sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if y_direction:
		velocity.y = y_direction * SPEED
		
		if y_direction == 1:
			anim_sprite.play("walk_down")
		else:
			anim_sprite.play("walk_up")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
