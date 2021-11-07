# frozen_string_literal: true

class WebhooksController < ApplicationController
  WEBHOOK_HEADERS = %w[HTTP_USER_AGENT CONTENT_TYPE HTTP_X_GITHUB_EVENT
                       HTTP_X_GITHUB_DELIVERY HTTP_X_HUB_SIGNATURE].freeze
  TYPES_ALLOWED = %w[issue_comment issues].freeze

  before_action :verify_event_type!

  def receive
    data = if request.headers['Content-Type'] == 'application/json'
             JSON.parse(request.body.read)
           else
             # application/x-www-form-urlencoded
             params.as_json
           end

    issue = Issue.create(action: data['action'])
    Event.create(payload: data, issue_id: issue.id)

    render nothing: true
  end

  private

  def error_message(msg)
    text = "Webhook invalid! #{msg}"

    render(status: 422, json: text)
  end

  def verify_event_type!
    type = request.headers['HTTP_X_GITHUB_EVENT']
    return if TYPES_ALLOWED.include?(type)

    error_message("Unhallowed event type: #{type}")
  end
end
