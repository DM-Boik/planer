extends RayCast3D

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
