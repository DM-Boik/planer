extends AeroBody3D

@onready var ui: Node2D = $CameraPivot/FPV/UI

var player_active = false
var PlayerIn = false

func _ready() -> void:
	add_to_group("vehicles")
	PlayerIn = false
	ui.hide()
	set_brake(10)

func _input(event):
	if event.is_action_pressed("enter") && event.is_pressed() && PlayerIn:
		_glider_control()
	elif player_active && event.is_action_pressed("enter") && event.is_pressed():
		leave_glider()

func _glider_control():
	var player = get_tree().get_first_node_in_group("player")
	ui.show()
	set_brake(0)
	player_active = true
	player.queue_free()

func leave_glider():
	var player = preload("res://scenes/player.tscn").instantiate()
	ui.hide()
	player_active = false
	set_brake(10)
	get_tree().current_scene.add_child(player)
	player.global_position.x = global_position.x + 2.0
	player.global_position.z = global_position.z + 1.0
	player.global_position.y = global_position.y + 1.0
	$CameraPivot/FPV.set_current(false)

func _physics_process(delta):
	if not player_active: return

func _on_enter_area_body_entered(body):
	if body == get_tree().get_first_node_in_group("player"):
		print("PLAYER")
		PlayerIn = true

func _on_enter_area_body_exited(body):
	if body == get_tree().get_first_node_in_group("player"):
		PlayerIn = false

func player_check():
	if PlayerIn:
		return true
	elif not PlayerIn:
		return false
