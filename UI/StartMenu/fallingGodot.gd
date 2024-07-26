extends Sprite2D
var isDropping = false
var speed = 10
var scaleIncrease = 0
var scaling = false
var isMoving = false
var moveIncrease = Vector2(0,0)
signal fell
signal done
var signaled = false
var targetScale = 0
var targetPos = Vector2(0,0)

func _process(delta):
	if(scaling):
		scale += Vector2(scaleIncrease, scaleIncrease) * delta
		if(scale.x>=targetScale):
			scaling = false
			scale = Vector2(targetScale,targetScale)
			$Label.visible = true
			done.emit()
			
	if(isMoving):
		position+=moveIncrease*delta
		if(targetPos.distance_to(position)<=10):
			isMoving = false
			position = targetPos
			
	if(isDropping):
		if(position.y>=350):
			position.y = 350
			if(!signaled):
				fell.emit()
				signaled = true
				
		else:
			position.y += 10
		
func scaleTo(tScale, time):
	scaleIncrease = float(tScale - scale.x) / float(time)
	targetScale = tScale
	scaling= true
	
func moveTo(coords, time):
	isDropping = false
	isMoving = true
	targetPos = coords
	moveIncrease.x = (coords.x - position.x)/float(time)
	moveIncrease.y = (coords.y - position.y)/float(time)
	
	
