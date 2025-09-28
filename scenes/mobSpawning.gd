extends Node2D

func _ready():
	var select = randf()
	if select < 0.3:
		makeAMob("orc")
	else:
		makeAMob("red")

func makeAMob(type):
	var newMob
	if type == "orc":
		newMob = preload("res://scenes/mobss/orc.tscn").instantiate()
	else:
		newMob = preload("res://scenes/mobss/red.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	newMob.global_position = %PathFollow2D.global_position
	add_child(newMob)


func _on_timer_timeout():
	_ready()
