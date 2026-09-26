extends Node3D

@export var dmg = 1
@onready var anim = $anim

var canSlash = false

var enemiesInRange = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(canSlash)
	if Input.is_action_pressed("attack") and canSlash and not anim.is_playing():
		print("Attacking")
		anim.play("Slash")
		canSlash = false
		if !enemiesInRange.is_empty():
			for e in enemiesInRange:
				e.hit(dmg)


func _on_hitbox_body_entered(body: Node3D) -> void:
	if body.is_in_group("Enemy") and not enemiesInRange.has(body):
		enemiesInRange.append(body)
		
func _on_hitbox_body_exited(body: Node3D) -> void:
	if enemiesInRange.has(body):
		enemiesInRange.erase(body)


func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Slash":
		canSlash = true
	elif anim_name == "Equip":
		canSlash = true
	elif anim_name == "Unequip":
		canSlash = false
		visible = false
