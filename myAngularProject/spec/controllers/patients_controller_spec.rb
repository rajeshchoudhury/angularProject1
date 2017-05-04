require 'spec_helper'

describe PatientsController do
  render_views
  describe "index" do
    before do
      Patient.create(name: 'Raoni Boaventura', email: 'raoni@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")
      Patient.create(name: 'Zlatan Ibrahimovic', email: 'zlatan@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")
      Patient.create(name: 'Lionel Messi', email: 'messi@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador, Bahia")
      Patient.create(name: 'Christiano Ronaldo', email: 'ronaldo@gmail.com', phone: '(09)8765-4321', sex: 'Male', birth: Date.new(1987, 11, 10), birthplace: "Brazilian", civilstate: "Maried", skin: "White", special_patient: false, address: "Rua Prof Dionísio P. de Alcantara, #30, Monte-serrat; Salvador")
      login_with create( :user )
      xhr :get, :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      ->(object) { object["name"] }
    end

    context "when the search finds results" do
      let(:keywords) { 'Raoni' }
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return one result' do
        expect(results.size).to eq(1)
      end
      it "should include 'Raoni Boaventura'" do
        expect(results.map(&extract_name)).to include('Raoni Boaventura')
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        expect(results.size).to eq(0)
      end
    end

  end

  describe "show" do
    before do
      login_with create( :user )
      xhr :get, :show, format: :json, id: patient_id
    end

    subject(:results) { JSON.parse(response.body) }

    context "when the patient exists" do
      let(:patient) { 
        Patient.create!(name: 'Raoni Boaventura', email: 'raoni@gmail.com', sex: 'Male')
      }
      let(:patient_id) { patient.id }

      it { expect(response.status).to eq(200) }
      it { expect(results["id"]).to eq(patient.id) }
      it { expect(results["name"]).to eq(patient.name) }
      it { expect(results["email"]).to eq(patient.email) }
    end

    context "when the patient doesn't exist" do
      let(:patient_id) { -9999 }
      it { expect(response.status).to eq(404) }
    end
  end

  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "should be redirected to signin" do
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end

  end
end