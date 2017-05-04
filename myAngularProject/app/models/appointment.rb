class Appointment < ActiveRecord::Base
	belongs_to :patient
	attr_accessor :patient_name

	def startDate
		d = self.date
		t = self.time
		dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
		return dt
	end

	def endDate
		addition =  (self.duration+1)*30
		return self.startDate + addition.minutes
	end

	def className
		self.visit_type
	end
end