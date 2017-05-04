json.array! @appointments do |appointment|
  json.id appointment.id
  json.visit_type appointment.visit_type
  json.date appointment.date
  json.time appointment.time
  json.duration appointment.duration
  json.patient_id appointment.patient_id
  json.patient_name appointment.patient.name
end