require 'rails_helper'

shared_examples_for 'activity_loggable' do
  let (:model) {create (described_class.to_s.underscore)}
  
  it { is_expected.to have_many(:activity_logs) }

  it "should create activity log on model update" do
    expect(model.activity_logs).to be_present
  end

  it "activity log should store model id and class" do
    expect(model.activity_logs.first.loggable_id).to eq model.id
    expect(model.activity_logs.first.loggable_type).to eq model.class.name
  end

  it "current & previous attr changes should be store in activity logs" do
    previous_name = model.first_name
    current_name = Faker::Name.first_name
    model.first_name = current_name
    model.save
    expect(model.activity_logs.last.changes_text).to eq "Changes: First Name from #{previous_name} to #{current_name}"
  end
end
  