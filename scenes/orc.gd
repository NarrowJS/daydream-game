extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null

func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position)/speed
		


func _on_hit_area_body_entered(body: Node2D):
	player = body
	player_chase = true

func _on_hit_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false
