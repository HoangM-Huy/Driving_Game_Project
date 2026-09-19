extends VehicleBody3D

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
	steering = Input.get_axis("move_right", "move_left") * 0.4
	engine_force = Input.get_axis("move_forward", "move_back") * 700
