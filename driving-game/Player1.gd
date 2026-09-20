extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 5
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO
@export var jump_impulse=20

var look_dir: Vector3
var side_dir: Vector3
@onready var camera = $Pivot/Player_camera
var camera_sens = 50

var mouseInput = Vector2.ZERO

var LockMouse = false

func _ready() -> void:
	LockMouse = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	var mouseMovements = mouseInput
	# Set back to Zero to prepare for the next frame.
	mouseInput = Vector2.ZERO
	
	# Rotate the character with the camera at once
	var rotateAngle = -mouseMovements.x * camera_sens * 0.005
	$Pivot.rotate_y(rotateAngle)
	
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	# Get the look direction (Forward / Backwards)
	look_dir = -$Pivot.global_transform.basis.z
	look_dir.y = 0
	look_dir = look_dir.normalized()
	
	# Get the side direction (Right / left)
	side_dir = $Pivot.global_transform.basis.x
	side_dir.y = 0
	side_dir = side_dir.normalized()
	
	# Add the looking direction and the side direction to make the final
	# moving direction vector
	var movingDirection = (look_dir * -input_dir.y) + (side_dir * input_dir.x)
	movingDirection = movingDirection.normalized()
	
	if movingDirection != Vector3.ZERO:
		velocity.x = movingDirection.x * speed
		velocity.z = movingDirection.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		velocity.y = velocity.y - (fall_acceleration * delta)
	# Jumping.
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_impulse
		
	move_and_slide()
	
func _input(event: InputEvent):
	# Mouse locking and unlocking
	if Input.is_action_just_pressed("Lock_Mouse"):
		LockMouse = !LockMouse
		if LockMouse:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	# Mouse movement
	if event is InputEventMouseMotion and LockMouse: 
		mouseInput += event.relative * 0.01
		
func enter_car():
	set_physics_process(false)
	hide()
	camera.current = false
	
func leave_car():
	set_physics_process(true)
	show()
	camera.current = true
