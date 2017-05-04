json.array! @appointments do |appointment|
  json.title appointment.patient.name
  json.start appointment.startDate
  json.end appointment.endDate
  json.className appointment.className
end