class_name viewport_patient
extends Sprite2D
var startPos = null
var bounce = 1
var walking = false
var walkingTo = null
var timeToWalk = null
var timeSpentWalking = 0
var flipAtEnd = false
var emitter = null
signal arrived



func flip():
	flip_h = !flip_h
func walkTo(coords : Vector2, time):
	#print("WALKING")
	walking = true
	startPos = position
	walkingTo = coords
	timeToWalk = time
func _physics_process(delta):
	if(walking):
		timeSpentWalking += delta
func _process(delta):
	#print(position)
	if(walking):
		position.x += (walkingTo.x-startPos.x)*(delta/timeToWalk)
		position.y += (walkingTo.y-startPos.y)*(delta/timeToWalk)
		position.y += sin(timeSpentWalking*10) * bounce
		if(timeSpentWalking>=timeToWalk):
			position = walkingTo
			walking = false
			timeSpentWalking = 0
			walkingTo = null
			if(flipAtEnd):
				flip()
			flipAtEnd = false
			arrived.emit()
			
func loadEmitter(newEmitter):
	if(emitter!=null):
		emitter.queue_free()
		emitter = null
	emitter = newEmitter.instantiate()
	add_child(emitter)
	emitter.scale = Vector2(0.1,0.1)
	
func clearEmitter():
	if(emitter==null):
		return
	else:
		emitter.queue_free()
		emitter = null
