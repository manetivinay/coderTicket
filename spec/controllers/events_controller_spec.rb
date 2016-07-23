require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET :show" do
    #before each test it will run the test
    before :each do
      @event = Event.create!(:name => "Britney Spears",
                         :extended_html_description => "This is the biggest event of th year",
                         :venue => Venue.new,
                         :category => Category.new,
                         :starts_at => 2.week.from_now,
                         :ends_at => 3.weeks.from_now,
                         :hero_image_url => "www.google.com")
      #slug is the name in the url when we go to the event it actually write outs the name of the url
      @event_slug = "#{@event.id}-britney-spears"
    end

    it "load sucessfully" do
      get :show, id: @event_slug
      expect(response).to be_success
    end

    it "load sucessfully" do
      get :show, id: @event_slug
      expect(response).to render_template 'show'
    end

    it "load the correct event" do
      get :show, id: @event_slug
      expect(assigns(:event)).to eq @event
    end

  end

end
