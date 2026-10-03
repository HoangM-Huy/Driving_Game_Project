extends Label

@onready var coltm = $"../../Player/Pivot/Player_camera/HandPivot/coltm4a1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Ammo: %d/%d" % [coltm.ammunition, coltm.max_ammunition]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_fire():
	coltm.ammunition -= 1
	text = "Ammo: %d/%d" % [coltm.ammunition, coltm.max_ammunition]

func _on_reload():
	text = "Ammo: %d/%d" % [coltm.max_ammunition, coltm.max_ammunition]
