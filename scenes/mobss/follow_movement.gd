class_name FollowMovementC extends Node

@export var speed = 2000

@onready var parent: CharacterBody2D = get_parent()

var start_position
var target: Player

func _ready():
	start_position = parent.position
	print(start_position)
	
func update_velocity():
	pass
	
func _physics_process(delta) -> void:
	update_velocity()
	parent.move_and_slide()

func _on_hit_area_body_entered(body):
	if body == Player:
		target = body
