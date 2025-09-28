extends Node

func _ready():
	makeMob()
	makeMob()
	makeMob()
	makeMob()
	


func makeMob():
	var mobmd = preload().instantiate()#put in mob tscn
	%PathFollow2D.progress_ratio = randf()
	mobmd.global_position = %PathFollow2D.global_position
	add.child(mobmd)

func game() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	makeMob()
