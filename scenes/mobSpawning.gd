extends Node2D

@export var current_level = 2
@onready var monster_dict = {
	1:1,
	2:2,
	3:3,
	4:4,
	5:5,
}

@onready var dead_enemies = 0

func enemy_death():
	print("enemy death")
	dead_enemies+=1
	if dead_enemies == monster_dict[current_level]:
		$InBetweenWaves.start()
		dead_enemies = 0


func makeAMob():
	for i in range(monster_dict[current_level]):
		var newMob = preload("res://scenes/mobs.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		newMob.global_position = %PathFollow2D.global_position
		add_child(newMob)
		print("spawned mob")
		await get_tree().create_timer(2.0).timeout	


func update_level(level):
	match level:
		1:
			print("level 1")
		2:
			print("level 2")
		3:
			print("level 3")
		4:
			print("level 4")
		5:
			print("level 5")
	makeAMob()
		
		

##func _on_timer_timeout():
##	_ready()
	
func _on_in_between_waves_timeout():
	print("leaving level")
	current_level += 1
	$hud/waveDisplay.text = "Wave: "+str(current_level)
	update_level(current_level)
