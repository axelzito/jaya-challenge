# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject(:event) { build :event }

  describe 'validations' do
    it { is_expected.to belong_to :issue }
  end
end
