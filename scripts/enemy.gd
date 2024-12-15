extends CharacterBody2D

const bulletPath = preload("res://scenes/enemy_bullet.tscn")

func take_damage_en():
	queue_free()

func _ready() -> void:
	$ShootCooldown.timeout.connect(shoot)
	
	

func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().get_parent().get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position
