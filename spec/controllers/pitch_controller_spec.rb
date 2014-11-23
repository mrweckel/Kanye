require 'rails_helper'

describe PitchesController do

  describe 'GET #index' do
    context 'with params[:pitch]' do
      it "renders at least 3 pitches on the index page" do
        pitches = []
        3.times do
          pitches << FactoryGirl.create(:pitch)
        end
        get :index
        expect(assigns(:pitches)).to match_array(pitches)
      end

      it "renders index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  # describe 'POST #create' do
  #   context "with valid attributes" do
  #     it "saves the new pitch in the database" do
  #       expect{
  #         post :create, pitch: attributes_for(:pitch)
  #       }.to change(Pitch, :count).by(1)
  #     end
  #   end
  # end


  describe'PATCH#update'do 
    before :each do
      @pitch = FactoryGirl.create(:pitch)
    end

    context "valid attributes" do
      it "locates the requested @pitch" do
        patch :update, id: @pitch, pitch: attributes_for(:pitch)
        expect(assigns(:pitch)).to eq(@pitch) 
      end

      it "changes @pitch's attributes" do 
        patch :update, id: @pitch, pitch: attributes_for(:pitch,
        title: 'title',
        url: 'www.youtube.com')
        @pitch.reload
        expect(@pitch.title).to eq('title')
        expect(@pitch.url).to eq('www.youtube.com')
      end

      it "redirects to the updated pitch" do
        patch :update, id: @pitch, pitch: attributes_for(:pitch) 
        expect(response).to redirect_to pitches_path
      end 
    end
  end

end
