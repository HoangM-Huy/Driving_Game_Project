extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Ammo: %d/%d" % [$"../../Player/Pivot/Player_camera/HandPivot/coltm4a1".ammunition, $"../../Player/Pivot/Player_camera/HandPivot/coltm4a1".max_ammunition]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_fire():
	$"../../Player/Pivot/Player_camera/HandPivot/coltm4a1".ammunition -= 1
	text = "Ammo: %d/%d" % [$"../../Player/Pivot/Player_camera/HandPivot/coltm4a1".ammunition, $"../../Player/Pivot/Player_camera/HandPivot/coltm4a1".max_ammunition]

func _on_reload():
	text = "Ammo: %d/%d" % [$"../../Player/Pivot/Player_camera/HandPivot/coltm4a1".max_ammunition, $"../../Player/Pivot/Player_camera/HandPivot/coltm4a1".max_ammunition]
