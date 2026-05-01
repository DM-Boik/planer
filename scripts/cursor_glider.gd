extends RayCast3D
#var flag_old = true
#var flag = false
#var animation_path : NodePath = ("../../../AnimationPlayer")
@onready var raycast: RayCast3D = $"."

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	force_raycast_update()
	if raycast.is_colliding():
		var target = get_collider()
		print(target)
		if target.has_method("activate"):
			print("YOU CAN ACTIVATE")
			if Input.is_action_just_pressed("activate"):
				target.activate()
			
#				flag = !flag
#	
#	if flag != flag_old:
#		if flag == true:
#			get_node(animation_path).play("door_open")
#		else:
#			get_node(animation_path).play("door_close")
#	flag_old = flag
