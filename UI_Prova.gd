extends Control



var label : TextEdit
var diceResult : Dictionary
var notificationData : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $ChatDisplay
	EventBus.add_observer(self, "rollDice", "_on_dice_rolled")

func action(observer,notificationName,notificationData):
	pass

func _on_dice_rolled(observer,  notificationName, diceResult ):
	label.text += "dice result " + diceResult.get("diceResult") + "\n"
	


func _on_Button_button_down():
	notificationData = { "diceSide": 6}
	EventBus.post_notification("buttonPressed",notificationData)




func _on_D6Button_button_down():
	notificationData = { "diceSide": 6}
	EventBus.post_notification("buttonPressed",notificationData)



func _on_D20Button_button_down():
	notificationData = { "diceSide": 20}
	EventBus.post_notification("buttonPressed",notificationData)
