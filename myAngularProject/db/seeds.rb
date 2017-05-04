# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "raonidonordeste@gmail.com", password: "12345678")
User.create(email: "shibata@gmail.com", password: "12345678")

Patient.create(name: 'Raoni Boaventura', email: 'raoni@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")
Patient.create(name: 'Zlatan Ibrahimovic', email: 'zlatan@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")
Patient.create(name: 'Lionel Messi', email: 'messi@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador, Bahia")
Patient.create(name: 'Christiano Ronaldo', email: 'ronaldo@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")
Patient.create(name: 'David Luis', email: 'david@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador, Bahia")
Patient.create(name: 'Thiago Silva', email: 'thiago@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")

Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 5), time: Time.new(2015, 6, 6,  10,  0,  0), duration: 2, patient_id: 1)
Appointment.create(visit_type: "Return", obs: "Just some text to illustrate", date: Date.new(2015, 6, 6), time: Time.new(2015, 6, 6,  11,  0,  0), duration: 3, patient_id: 1)
Appointment.create(visit_type: "Consult", obs: "Just some text to illustrate", date: Date.new(2015, 6, 7), time: Time.new(2015, 6, 6,  12,  0,  0), duration: 2, patient_id: 2)
Appointment.create(visit_type: "Return", obs: "Just some text to illustrate", date: Date.new(2015, 6, 8), time: Time.new(2015, 6, 6,  13,  0,  0), duration: 1, patient_id: 2)
Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 9), time: Time.new(2015, 6, 6,  14,  0,  0), duration: 2, patient_id: 3)
Appointment.create(visit_type: "Consult", obs: "Just some text to illustrate", date: Date.new(2015, 6, 10), time: Time.new(2015, 6, 6,  15,  0,  0), duration: 0, patient_id: 3)
Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 11), time: Time.new(2015, 6, 6,  16,  0,  0), duration: 0, patient_id: 4)
Appointment.create(visit_type: "Return", obs: "Just some text to illustrate", date: Date.new(2015, 6, 12), time: Time.new(2015, 6, 6,  17,  0,  0), duration: 2, patient_id: 4)
Appointment.create(visit_type: "Consult", obs: "Just some text to illustrate", date: Date.new(2015, 6, 13), time: Time.new(2015, 6, 6,  18,  0,  0), duration: 0, patient_id: 5)
Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 14), time: Time.new(2015, 6, 6,  19,  0,  0), duration: 2, patient_id: 5)