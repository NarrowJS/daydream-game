extends TextureProgressBar

@export var player: Player
# Called when the node enters the scene tree for the first time.
func _ready():
	
	update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update():
	value = player.currentHealth * 100 / player.maxHealth
