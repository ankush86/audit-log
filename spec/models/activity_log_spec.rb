require 'rails_helper'

describe ActivityLog do
  it { is_expected.to belong_to(:loggable) }
end