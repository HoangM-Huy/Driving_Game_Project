extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_garage_zone_body_entered(body: Node3D) -> void:
	if body.is_in_group("Vehicles"):
		print("Car parked inside the garage")
	elif body.is_in_group("Player"):
		print("Player inside the garage")
		

func _on_garage_zone_body_exited(body: Node3D) -> void:
	if body.is_in_group("Vehicles"):
		print("Car left the garage")
