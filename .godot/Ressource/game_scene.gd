extends Node2D

@export var platform_scene: PackedScene = preload("res://note.tscn")  # La scène de plateforme à instancier
@export var spawn_rate: float = 1  # Temps entre chaque apparition
@export var min_x: float = -130  # Position X minimale
@export var max_x: float = 130   #Position X maximale
@export var spawn_y: float =-80 # Position Y de spawn (hors écran)

func _ready():
	# Lancer un timer pour spawn des plateformes
	var spawn_timer = Timer.new()
	spawn_timer.wait_time = spawn_rate
	spawn_timer.autostart = true
	spawn_timer.timeout.connect(_spawn_platform)
	add_child(spawn_timer)

func _spawn_platform():
	var new_platform = platform_scene.instantiate()  # Créer une plateform
	new_platform.position = Vector2(randi_range(min_x, max_x), spawn_y)
	min_x = new_platform.position.x - 40
	max_x = new_platform.position.x + 40
	if(min_x<-80):
		min_x =80
	if(max_x>80):
		max_x=80
	
	get_parent().add_child(new_platform)  # Ajouter la plateforme à la scène
