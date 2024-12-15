extends Control

@onready var empezar: Button = $VBoxContainer/Empezar
@onready var creditos: Button = $VBoxContainer/Creditos
@onready var salir: Button = $VBoxContainer/Salir

var main = preload("res://scenes/main.tscn")
var credits = preload("res://ui/creditos.tscn")

func _ready() -> void:
	empezar.pressed.connect(_on_empezar_pressed)
	creditos.pressed.connect(_on_creditos_pressed)
	salir.pressed.connect(func(): get_tree().quit())

func _on_empezar_pressed() -> void:
	get_tree().change_scene_to_packed(main)

func _on_creditos_pressed() -> void:
	get_tree().change_scene_to_packed(credits)
