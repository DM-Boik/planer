extends Node3D

@onready var camera: Camera3D = $FPV

var sensivity : float = 0.01

func _input(event : InputEvent):
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * sensivity
		camera.rotation.x -= event.relative.y * sensivity
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))
