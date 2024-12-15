extends CharacterBody2D

const SPEED = 300.0
const bulletPath = preload("res://scenes/bullet.tscn")
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var cool_down = $ShootCooldown
@onready var shoot_sfx = $ShootSFX


func _process(delta) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
		await get_tree().create_timer(0.38).timeout

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_up", "ui_down")
	if direction:
		playback.travel("move")
		velocity.y = direction * SPEED
	else:
		playback.travel("idle")
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func shoot():
	if cool_down.time_left:
		return
	playback.travel("shoot")
	await get_tree().create_timer(0.18).timeout
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position
	shoot_sfx.play()
	cool_down.start()
	
func take_damage():
	queue_free()
