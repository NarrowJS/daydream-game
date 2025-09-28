extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options: Panel = $Options


func _ready():
	main_buttons.visible = true
	options.visible = false;

func _process(delta):
	pass

func _on_start_pressed():
	print("Start pressed")
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	
func _on_exit_pressed():
	print("exit pressed")
	get_tree().quit()


func _on_options_pressed():
	main_buttons.visible = false
	options.visible = true


func _on_back_pressed():
	options.visible = false
	main_buttons.visible = true
