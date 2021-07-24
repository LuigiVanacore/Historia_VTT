extends Node



var event_dictionary : Dictionary

func _ready():
	event_dictionary = {};

func post_notification(event_id : String, event_data):
	if event_dictionary.has(event_id):
		var currentObservers=event_dictionary[event_id].observers
		for i in currentObservers:
			var anObserver =  currentObservers[i]
			if anObserver.object.has_method(anObserver.action):
				anObserver.object.call(anObserver.action,anObserver.object,event_id, event_data)

func add_observer(observer,event_id,action):
	if not event_dictionary.has(event_id):
		event_dictionary[event_id]={
			"observers":{}
		}
	var currentObservers=event_dictionary[event_id].observers
	currentObservers[observer.get_instance_id()]={
		"object":observer,
		"action":action
	}

func remove_observer(observer, event_id):
	if event_dictionary.has(event_id):
		var currentObservers=event_dictionary[event_id].observers
		if currentObservers.has(observer.get_instance_id()):
			currentObservers.erase(observer.get_instance_id())


