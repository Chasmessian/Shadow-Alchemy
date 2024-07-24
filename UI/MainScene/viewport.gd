class_name viewport
extends Control
static var instance = null
var patient : viewport_patient = null
signal arrived
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
func patientLeave():
	#patient.flip()
	patient.walkTo(get_node("Leave").position, 5)
	patient.flipAtEnd = true
	patient.arrived.connect(func(): 
		arrived.emit()
		print("ARRIVED"))
func _ready():
	patient = get_node("Patient")
	
func loadPatient(p):
	patient.texture = p.texture
	patient.position = get_node("Leave").position
	bringOutPatient(patient)
	
	#something to do with dialogue
