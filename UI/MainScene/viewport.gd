class_name viewport
extends Control
static var instance = null
var patient : viewport_patient = null
var conversationMaster = ConversationMaster.new()
@onready var audioPlayer = $AudioStreamPlayer
signal patientArrived
signal patientLeft
static var patientIn = false
func _init():
	if(instance==null):
		instance = self
	else:
		queue_free()
func bringOutPatient(newPatient):
	#patient.texture = newPatient.texture
	patient.walkTo(get_node("Walkto").position, 5)
	patient.flipAtEnd = true
	#patient.flip()
	patient.arrived.connect(func(): 
		print("ARRIVED OUT")
		viewport.patientIn = true
		#print("PATIENT IS IN? THE ANSWER IS " + str(patientIn))
		patientArrived.emit()
		conversationMaster.newConversation(World.instance.patient.conversationNode)
		,4)
		
func patientLeave():
	viewport.patientIn = false		
	#patient.flip()
	#QuestionContainer.instance.clear()
	ConversationMaster.instance.clearConversation()
	patient.walkTo(get_node("Leave").position, 5)
	patient.flipAtEnd = true
	conversationMaster.clearConversation()
	patient.arrived.connect(func(): 
		patient.clearEmitter()
		patientLeft.emit()
		,4)
func _ready():
	patient = get_node("Patient")
	audioPlayer.volume_db = Settings.getDialogueVolume()
	Settings.dialogueChanged.connect(func():
		audioPlayer.volume_db =  Settings.getDialogueVolume())
	
func loadPatient(p):
	patient.texture = p.texture
	patient.position = get_node("Leave").position
	if(p.particlesGetCured):
		World.instance.patientRating.connect(func(rating):
			if(rating=="perfect"):
				patient.clearEmitter(),4)
	if(p.particles!=null):
		patient.loadEmitter(p.particles)
	bringOutPatient(patient)

	#something to do with dialogue
