extends Control

func _ready():
	pass

func _process(delta):
	pass

func _on_start_pressed():
	print("Start pressed")
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_settings_pressed():
	print("settings pressed")


func _on_exit_pressed():
	print("exit pressed")
	get_tree().quit()
