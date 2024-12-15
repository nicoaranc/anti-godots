extends Control

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var sound: AudioStreamPlayer = $SFX
@onready var sfx: Button = $VBoxContainer/SFX
@onready var volver: Button = $VBoxContainer/Volver
@onready var menu = load("res://ui/menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sfx.pressed.connect(_on_sfx_pressed)
	volver.pressed.connect(_on_volver_pressed)

func _on_sfx_pressed() -> void:
	sound.play()


func _on_volver_pressed() -> void:
	get_tree().change_scene_to_packed(menu)
	
