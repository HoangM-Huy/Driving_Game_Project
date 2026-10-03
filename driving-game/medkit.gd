extends Node3D

@export var healValue = 50
@onready var anim = $anim

var canHeal = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use_medkit") and canHeal and not anim.is_playing():
		print("Healing")
		anim.play("Consume")
		canHeal = false

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Consume":
		canHeal = true
