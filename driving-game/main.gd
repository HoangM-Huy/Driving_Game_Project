extends Node

@onready var coltm = $Player/Pivot/Player_camera/HandPivot/coltm4a1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.MOUSE_MODE_CAPTURED
	coltm.fire.connect($Ammo/Ammunition._on_fire.bind())
	coltm.reload.connect($Ammo/Ammunition._on_reload.bind())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
