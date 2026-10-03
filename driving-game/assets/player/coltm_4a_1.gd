extends Node3D

const ADS_LERP = 20
signal fire
signal reload

var bullet = load("res://bullet.tscn")
var instance

@export var ammunition = 30
@export var max_ammunition = 30

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
		if !gun_anim.is_playing() and ammunition != 0:
			if is_aiming == false:
				fire.emit()
				gun_anim.play("shoot")
				instance = bullet.instantiate()
				get_tree().current_scene.add_child(instance)
				instance.global_transform = gun_barrel.global_transform
			elif is_aiming == true:
				fire.emit()
				gun_anim.play("aim_shoot")
				instance = bullet.instantiate()
				get_tree().current_scene.add_child(instance)
				instance.global_transform = gun_barrel.global_transform
				
	if Input.is_action_pressed("reload"):
		ammunition = 0
		reload.emit()
		gun_anim.play("reload")
		ammunition = max_ammunition
		
		
		
		
