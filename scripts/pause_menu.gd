extends Control

@onready var continuar: Button = $VBoxContainer/Continuar
@onready var reiniciar: Button = $VBoxContainer/Reiniciar
@onready var main_menu: Button = $VBoxContainer/MainMenu
@onready var salir: Button = $VBoxContainer/Salir
@onready var main = $".."
@onready var menu = load("res://ui/menu.tscn")
@onready var repeat = load("res://scenes/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	salir.pressed.connect(func(): get_tree().quit())
	continuar.pressed.connect(func(): main.pauseMenu())
	main_menu.pressed.connect(_on_main_menu_pressed)
	reiniciar.pressed.connect(_on_reiniciar_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_packed(menu)
	main.pauseMenu()


func _on_reiniciar_pressed() -> void:
	main.pauseMenu()
	get_tree().reload_current_scene()
