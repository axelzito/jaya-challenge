# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::IssuesController, type: :controller do
  let(:json) { JSON.parse(response.body) }

  describe 'GET index' do
    let(:issue) { create(:issue, action: 'create') }
    let(:event) { create(:event, issue: issue) }

    before do
      get :index, params: { issue_id: issue.id }
    end

    it 'filters by issue issue_id' do
      expect(json.count).to eq(1)
    end
  end
end
