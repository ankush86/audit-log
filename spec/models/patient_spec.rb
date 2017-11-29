require 'rails_helper'

describe Patient do
  it_behaves_like 'activity_loggable'

  it "should exists PARAMS_TO_EXCLUDE constant" do
    expect(Patient::PARAMS_TO_EXCLUDE).to eq [:id, :created_at, :updated_at]
  end

end