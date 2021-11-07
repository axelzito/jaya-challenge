# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SaveIssueEventService, type: :lib do
  let(:params) do
    { 'id' => '123',
      'action' => 'edited',
      'changes' =>
        { 'body' =>
            { 'from' => 'att' } } }
  end
  let(:response) { described_class.call(params) }

  it 'returns a not null response' do
    # expect(response).to eq(response)
    expect(response).not_to eq(nil)
  end

  it 'creates an issue' do
    expect { response }.to change(Issue, :count).by(1)
  end

  it 'creates an event' do
    expect { response }.to change(Event, :count).by(1)
  end
end
