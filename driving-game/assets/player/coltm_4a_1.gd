extends Node3D

const ADS_LERP = 20

@onready var camera = $"../../../../../Player_camera"

@export var default_position: Vector3
@export var ads_position: Vector3

var fview = {"Default": 75.0, "ADS": 60.0}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("attack2"):
		transform.origin = transform.origin.lerp(ads_position, ADS_LERP * delta)
		camera.fov = lerp(camera.fov, fview["ADS"], ADS_LERP * delta)
	else:
		transform.origin = transform.origin.lerp(default_position, ADS_LERP * delta)
		camera.fov = lerp(camera.fov, fview["Default"], ADS_LERP * delta)
