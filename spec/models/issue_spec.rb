# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Issue, type: :model do
  subject(:issue) { build :issue }

  describe 'validations' do
    it { is_expected.to have_many(:events) }
  end
end
