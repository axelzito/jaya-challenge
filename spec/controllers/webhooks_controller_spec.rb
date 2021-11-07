# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WebhooksController, type: :controller do
  let(:json) { { 'test' => '1' } }

  it 'returns a not null response' do
    expect(json).not_to eq(nil)
  end
end
