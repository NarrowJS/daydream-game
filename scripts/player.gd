extends CharacterBody2D

class_name Player

@export var speed: float = 100.0

@export var attacking = false

@export var maxHealth = 30

@onready var currentHealth: int = 15

@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		attack()

func attack():
	var overlapping_objects = $attackarea.get_overlapping_areas()
	for area in overlapping_objects:
		var parent = area.get_parent()
		print(parent.name)
	
	attacking = true
	animated_sprite.play("attack")
	await animated_sprite.animation_finished
	attacking = false
	animated_sprite.play("idle")
	

func update_animation():
	if !attacking:
		animated_sprite.play("idle")

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	var direction = Input.get_axis("ui_left", "ui_right")

	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1

	input_vector = input_vector.normalized()
	velocity = input_vector * speed
	
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false
	if direction == 0 && !attacking:
		animated_sprite.play("idle")
	elif !attacking:
		animated_sprite.play("walk")
	move_and_slide()
