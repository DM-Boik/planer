extends AeroBody3D

# Этот флаг показывает, управляет ли сейчас игрок этим самолётом
var is_active := false

func _ready():
	# На старте самолёт неактивен (управление у игрока)
	set_active(false)
	
	# Находим зону посадки (покажите на неё в редакторе или найдите по имени)
	var area = $enter_area 
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name == "Player": # Или проверка по группе/классу
		print("Player entered")
		body.nearby_plane = self

func _on_body_exited(body):
	if body.name == "Player":
		body.nearby_plane = null

func set_active(active: bool):
	is_active = active
	set_process_input(active)
	set_physics_process(active) # Если обработка в _physics_process
	
	# Дополнительно: включаем/выключаем захват мыши
	if active:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
