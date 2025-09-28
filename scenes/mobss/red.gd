extends CharacterBody2D

@export var speed: float = 60.0  # pixels per second
var player_chase: bool = false
var player: Player = null
var man = null

func _ready():
	man = get_node("/root/game/player")

func _physics_process(delta):
	if player_chase and player:
		# Direction towards player
		var direction = (player.position - position).normalized()
		velocity = direction * speed
		
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = player.position.x < position.x
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()


func _on_hit_area_body_entered(body):
	if body is Player:
		print("Player detected:", body)
		player = body
		player_chase = true


func _on_hit_area_body_exited(body):
	if body == player:
		print("Player left:", body)
		player = null
		player_chase = false


func _on_orc_hit_p(body):
	print("peeeee")
	man.emit_signal("healthChanged", null)
	man.currentHealth -= 1
	print(man.currentHealth)
	await get_tree().create_timer(1.0).timeout
