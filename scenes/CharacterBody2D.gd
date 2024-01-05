extends CharacterBody2D


const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animator = get_node("AnimationPlayer")

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	var xTranslate = false
	
	if direction:
		xTranslate = true
		velocity.x = direction * SPEED
		
		if direction == -1:
			animator.play("RunLeft")
		else:
			animator.play("RunRight")
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * SPEED
		if not xTranslate:
			if direction == 1:
				animator.play("RunDown")
			else:
				animator.play("RunUp")
				
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		if not xTranslate:
			animator.play("IdleDown")

	move_and_slide()
