extends Node2D

func _ready():
	makeAMob()
	makeAMob()
	makeAMob()



func makeAMob():
	var newMob = preload("res://scenes/mobs.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	newMob.global_position = %PathFollow2D.global_position
	add_child(newMob)


func _on_timer_timeout():
	_ready()
