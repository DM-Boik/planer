extends RayCast3D

@onready var raycast : RayCast3D = $"."

var flag : bool = false
var flag_old : bool = flag

var animation_path : NodePath = ("../../../AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	force_raycast_update()
	var collider = get_collider()
	print(collider)
	if raycast.is_colliding():
		if collider.name == "lever":
			if Input.is_action_just_released("activate"):
				flag = !flag
	
	if flag != flag_old:
		if flag == true:
			get_node(animation_path).play("door_open")
		else:
			get_node(animation_path).play("door_close")
	flag_old = flag
