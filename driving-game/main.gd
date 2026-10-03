extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.MOUSE_MODE_CAPTURED
	$Player/Pivot/Player_camera/HandPivot/coltm4a1.fire.connect($Ammo/Ammunition._on_fire.bind())
	$Player/Pivot/Player_camera/HandPivot/coltm4a1.reload.connect($Ammo/Ammunition._on_reload.bind())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
