extends VehicleBody3D

@onready var input_label: Label3D = $InputLabel

var withPlayer = false

func _input(event: InputEvent) -> void:
	var canEnter = input_label.visible and not withPlayer
	var canLeave = withPlayer
	
	if Input.is_action_just_pressed("interaction") and canEnter:
		_enter_car()
	elif Input.is_action_just_pressed("interaction") and canLeave:
		_leave_car()
	
func _enter_car():
	withPlayer = true
	
	var player = get_tree().get_first_node_in_group("player")
	player.enter_car()
	
func _leave_car():
	withPlayer = false
	var player = get_tree().get_first_node_in_group("player")
	player.leave_car()
	
	player.global_position = global_position

func _ready() -> void:
	var frontLeft = $Pivot/Sedan/FrontLeft
	var frontRight = $Pivot/Sedan/FrontRight
	var rearLeft = $Pivot/Sedan/RearLeft
	var rearRight = $Pivot/Sedan/RearRight
	
	frontLeft.reparent($FrontLeft)
	frontRight.reparent($FrontRight)
	rearLeft.reparent($RearLeft)
	rearRight.reparent($RearRight)
	
	frontLeft.position = Vector3.ZERO
	frontRight.position = Vector3.ZERO
	rearLeft.position = Vector3.ZERO
	rearRight.position = Vector3.ZERO

func _physics_process(_delta: float) -> void:
	if not withPlayer: return
	steering = Input.get_axis("move_right", "move_left") * 0.4
	engine_force = Input.get_axis("move_forward", "move_back") * 1000
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		input_label.show()


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		input_label.hide()
