# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WebhooksController, type: :controller do
  describe 'POST #receive' do
    subject { post :receive, body: json, format: :json, params: params }

    let(:json) do
      {
        'action' => 'opened',
        'issue' => {
          'id' => 22_222_222,
          'number' => 1,
          'user' => {
            'login' => 'axelzito',
            'id' => 55_555
          }
        }
      }
    end
    let(:params) { { parsed_request: json, event_type: 'issues' } }

    before do
      request.headers['HTTP_X_GITHUB_EVENT'] = params[:event_type]
      # request.headers['Content-Type'] = 'application/json'
      request.accept = 'application/json'
    end

    context 'when it is a valid webhook' do
      it 'is successful' do
        expect(subject).to be_successful
      end

      it 'does create a new event and issue' do
        subject
        expect(Event.count).to eq(1)
        expect(Issue.count).to eq(1)
      end
    end

    context 'when it is not a valid webhook' do
      let(:params) { { parsed_request: json, event_type: 'pull_request' } }

      it 'is not successful' do
        expect(subject).not_to be_successful
      end

      it 'responds with 422' do
        expect(subject.response_code).to eq(422)
      end

      it 'does not create a new event' do
        subject
        expect(Event.count).to eq(0)
      end
    end
  end
end
