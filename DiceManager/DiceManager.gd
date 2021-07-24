extends Node





export var minimun_value :  int = 1

var notificationData

var rng = RandomNumberGenerator.new()
var EventBus : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	
	EventBus = $"/root/EventBus"
	EventBus.add_observer(self, "buttonPressed", "_on_button_pressed")
	

func subrscribeToEventBus():
	
	pass


func _on_button_pressed(observer, notificationName, notificationData):
	rollDice(notificationData["diceSide"])

func rollDice(diceSide: int ) -> int:
	var value = rng.randi_range(minimun_value, diceSide)
	EventBus.post_notification("rollDice", { "diceResult": str(value) })
	return value
