extends CharacterBody3D

@onready var camera: Node3D = $CameraPivot
@onready var player_mesh: MeshInstance3D = $MeshInstance3D

const G : float = 9.8
const jump = 5
var speed : float = 3.0
var index_cam = 1

var nearby_plane = null # Ссылка на самолёт, рядом с которым мы стоим

func _ready() -> void:
	add_to_group("player")

func _process(_delta : float):
	pass



func _physics_process(delta: float):
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
	if event.is_action_pressed("activate") and nearby_plane:
		get_tree().call_group("game_manager", "enter_plane", self, nearby_plane)
