require 'spec_helper'

describe AppointmentsController do
  render_views
  describe "index" do
    before do
      User.create(email: "raonidonordeste@gmail.com", password: "12345678")
      User.create(email: "shibata@gmail.com", password: "12345678")

      Patient.create(name: 'Raoni Boaventura', email: 'raoni@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")
      Patient.create(name: 'Zlatan Ibrahimovic', email: 'zlatan@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")
      Patient.create(name: 'Lionel Messi', email: 'messi@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador, Bahia")
      Patient.create(name: 'Christiano Ronaldo', email: 'ronaldo@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")

      Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 5), time: Time.new(2015, 6, 6,  10,  0,  0), duration: 2, patient_id: 1)
      Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 6), time: Time.new(2015, 6, 6,  11,  0,  0), duration: 2, patient_id: 1)
      Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 7), time: Time.new(2015, 6, 6,  12,  0,  0), duration: 2, patient_id: 2)
      Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 8), time: Time.new(2015, 6, 6,  13,  0,  0), duration: 2, patient_id: 2)
      Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 9), time: Time.new(2015, 6, 6,  14,  0,  0), duration: 2, patient_id: 3)
      Appointment.create(visit_type: "Evaluation", obs: "Just some text to illustrate", date: Date.new(2015, 6, 10), time: Time.new(2015, 6, 6,  15,  0,  0), duration: 2, patient_id: 3)
      login_with create( :user )
      xhr :get, :index, format: :json
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_visit_type
      ->(object) { object["visit_type"] }
    end

    context "when the list is requested" do
      it "returns the appointment list" do
      	expect(results.map(&extract_visit_type)).to include('Evaluation')
      end
  	end
  end

end
