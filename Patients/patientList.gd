class_name PatientList
extends Node
static var patients = [
	#"res://Patients/List/Patient1/patient1.gd", #examples
	#"res://Patients/List/Patient2/patient2.gd",
	"res://Patients/List/Patient A/patient_a.gd",
	"res://Patients/List/Patient B/patient_b.gd",
	"res://Patients/List/Patient C/patient_c.gd",
	"res://Patients/List/Patient D/patient_d.gd",
	"res://Patients/List/Patient E/patient_e.gd",
	"res://Patients/List/Patient F/patient_f.gd",
	"res://Patients/List/Patient G/patient_g.gd",
	"res://Patients/List/Patient H/patient_h.gd",
	"res://Patients/List/Patient I/patient_i.gd",
	"res://Patients/List/Patient J/patient_j.gd",
	"res://Patients/List/Patient K/patient_k.gd",
	"res://Patients/List/Patient L/patient_l.gd",
	"res://Patients/List/Patient M/patient_m.gd",
	"res://Patients/List/Patient N/patient_n.gd",
	"res://Patients/List/Patient O/patient_o.gd"
	] #contains script references, World will load thems
static func getPatient():
	if(len(patients)==0):
		return null
	var randNum = randi_range(0,len(patients)-1)
	#print(randNum)
	return patients.pop_at(randNum)
