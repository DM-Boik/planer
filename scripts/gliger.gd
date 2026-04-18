extends AeroBody3D

var player_active = false
var PlayerIn = false

func _ready() -> void:
	PlayerIn = false	

func _input(event):
	if event.is_action_pressed("enter") && event.is_pressed() && PlayerIn:
		_glider_control()
	elif player_active && event.is_action_pressed("enter") && event.is_pressed():
		leave_car()

func _glider_control():
	var player = get_tree().get_first_node_in_group("player")
	
	player_active = true
	player.queue_free()

func leave_car():
	var player = preload("res://scenes/player.tscn").instantiate()
	
	player_active = false
	get_tree().current_scene.add_child(player)
	player.global_position = global_position

func _physics_process(delta):
	if not player_active: return
	

func _on_enter_area_body_entered(body):
	if body == get_tree().get_first_node_in_group("player"):
		print("PLAYER")
		PlayerIn = true

func _on_enter_area_body_exited(body):
	if body == get_tree().get_first_node_in_group("player"):
		PlayerIn = false
