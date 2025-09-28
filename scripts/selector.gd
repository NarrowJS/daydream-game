extends Control


# Called when the node enters the scene tree for the first time.
var is_open = false

func _ready():
	open()
	
func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = true
