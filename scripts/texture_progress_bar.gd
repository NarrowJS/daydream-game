extends TextureProgressBar

@export var player: Player

func _ready():
	if player:
		player.connect("healthChanged", Callable(self, "_on_health_changed"))
		_update_bar()  # initialize the bar with current health

# This function will be called when the signal fires
func _on_health_changed(new_health):
	_update_bar()

# Updates the progress bar value
func _update_bar():
	if player:
		value = player.currentHealth * 100 / player.maxHealth
