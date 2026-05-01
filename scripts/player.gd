extends CharacterBody3D

@onready var camera: Node3D = $CameraPivot
@onready var player_mesh: MeshInstance3D = $MeshInstance3D
@onready var raycast: RayCast3D = $CameraPivot/FPV/RayCast3D


const G : float = 9.8
const jump = 5
var speed : float = 3.0


func _ready() -> void:
	add_to_group("player")

func _process(_delta : float):
	pass

func _physics_process(delta: float):
	
	raycast.force_raycast_update()
	if raycast.is_colliding():
		var target = raycast.get_collider()
		print(target)
		if target.has_method("activate"):
			print("YOU CAN ACTIVATE")
			if Input.is_action_just_pressed("activate"):
				target.activate()
	
	if not is_on_floor():
		velocity.y -= G * delta
	
	if Input.is_action_pressed("jump") && is_on_floor():
		velocity.y = jump
	
	var input_dir : Vector2 = Input.get_vector("left", "right", 'forward', 'backward')
	var direction := (camera.basis * Vector3(input_dir.x, 0.0, input_dir.y)).normalized()
	if direction:
		player_mesh.basis = camera.basis
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0.0, speed)
		velocity.z = move_toward(velocity.z, 0.0, speed)

	move_and_slide()

func _input(event):
	pass
