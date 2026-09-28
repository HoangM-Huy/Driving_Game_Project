extends Node3D

const ADS_LERP = 20

var bullet = load("res://bullet.tscn")
var instance

@onready var camera = $"../.."
@onready var gun_anim = $Shoot
@onready var gun_barrel = $Barrel

@export var default_position: Vector3
@export var ads_position: Vector3

var is_aiming = false

var fview = {"Default": 75.0, "ADS": 60.0}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("attack2"):
		transform.origin = transform.origin.lerp(ads_position, ADS_LERP * delta)
		is_aiming = true
		camera.fov = lerp(camera.fov, fview["ADS"], ADS_LERP * delta)
	else:
		transform.origin = transform.origin.lerp(default_position, ADS_LERP * delta)
		is_aiming = false
		camera.fov = lerp(camera.fov, fview["Default"], ADS_LERP * delta)
		
	if Input.is_action_pressed("attack"):
		if !gun_anim.is_playing():
			if is_aiming == false:
				gun_anim.play("shoot")
				instance = bullet.instantiate()
				get_tree().current_scene.add_child(instance)
				instance.global_transform = gun_barrel.global_transform
			elif is_aiming == true:
				gun_anim.play("aim_shoot")
				instance = bullet.instantiate()
				get_tree().current_scene.add_child(instance)
				instance.global_transform = gun_barrel.global_transform
		
		
		
