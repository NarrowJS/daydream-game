extends Control


# Called when the node enters the scene tree for the first time.
var is_open = false

var selected_buff = null
var selected_sacrifice = null

var buffs = {
	"btn1" : "speed",
	"btn2": "strength",
	"btn3": "knockback"
}
var player = null
func _ready():
	player = get_node("/root/game/player")
	for i in range(1, 4):  # buttons named Button1 .. Button6
		var btn = $TextureRect/sacrificeCont.get_node("btn%d" % i)
		btn.pressed.connect(_on_button_pressed.bind("sacrifice",btn))
	for i in range(1, 4):  # buttons named Button1 .. Button6
		var btn = $TextureRect/buffCont.get_node("btn%d" % i)
		btn.pressed.connect(_on_button_pressed.bind("buff",btn))
	
	var submitBtn = $TextureRect/submit
	submitBtn.pressed.connect(_apply_player_stats)
	open()

func _on_button_pressed(type,button):
	if type == "buff":
		_select_button_in_group($TextureRect/buffCont, button)
		selected_buff = button.name
	elif type == "sacrifice":
		_select_button_in_group($TextureRect/sacrificeCont, button)
		selected_sacrifice = button.name
	
	print("selected buff: ",selected_buff , "  selected sacrifice:",selected_sacrifice)

func _select_button_in_group(group_node, chosen_button):
	for btn in group_node.get_children():
		btn.modulate = Color(1, 1, 1)  # reset to normal
	chosen_button.modulate = Color(0.5, 1, 0.5)  # highlight
	
	
func _apply_player_stats():
	if selected_buff and selected_sacrifice:
		var buffType = buffs[selected_buff]
		
		
		if buffType == "speed":
			player.speed = 200
		
			
		
		
		close()
	
func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
