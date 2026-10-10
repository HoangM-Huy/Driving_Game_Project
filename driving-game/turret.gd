extends Node3D

@export var turretEnable = false

var mouseInput = Vector2.ZERO
var camera_sens = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var barrel = $minigun_turret/Barrels
	var clamp = $minigun_turret/Clamp
	var controlUnit = $"minigun_turret/Control unit"
	var feed = $minigun_turret/Feed
	var handle = $minigun_turret/Handle
	var handleAttachBottom = $minigun_turret/HandleAttachBottom
	var handleAttachTop = $minigun_turret/HandleAttachTop
	var mainBody = $"minigun_turret/Main body"
	var motor = $minigun_turret/Motor
	var mount = $minigun_turret/Mount
	var ring = $minigun_turret/Ring
	var rotor = $minigun_turret/Rotor
	var shroud = $minigun_turret/Shroud
	var trigger = $minigun_turret/Trigger
	
	mount.reparent($minigun_turret/Support)
	ring.reparent($minigun_turret/Support)
	
	barrel.reparent($minigun_turret/Gun)
	clamp.reparent($minigun_turret/Gun)
	controlUnit.reparent($minigun_turret/Gun)
	feed.reparent($minigun_turret/Gun)
	handle.reparent($minigun_turret/Gun)
	handleAttachBottom.reparent($minigun_turret/Gun)
	handleAttachTop.reparent($minigun_turret/Gun)
	mainBody.reparent($minigun_turret/Gun)
	motor.reparent($minigun_turret/Gun)
	rotor.reparent($minigun_turret/Gun)
	shroud.reparent($minigun_turret/Gun)
	trigger.reparent($minigun_turret/Gun)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var mouseMovements = mouseInput
	
	mouseInput = Vector2.ZERO
	
	var rotateAngle = -mouseMovements.x * camera_sens * 0.005
	var yaw = mouseMovements.y * camera_sens * 0.005
	
	if turretEnable:
		# Horizontal movement
		$minigun_turret.rotate_y(rotateAngle)
		
		# Vertical movement
		# Moving down
		if $minigun_turret/Gun.rotation_degrees.x > 20 and yaw > 0:
			pass
		# Moving up
		elif $minigun_turret/Gun.rotation_degrees.x < -70 and yaw < 0:
			pass
		else:
			$minigun_turret/Gun.rotate_x(yaw)
	
func _input(event: InputEvent):
	if event is InputEventMouseMotion: 
		mouseInput += event.relative * 0.01
