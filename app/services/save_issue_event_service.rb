# frozen_string_literal: true

class SaveIssueEventService < ApplicationService
  def initialize(params)
    @data = params
  end

  def call
    create_issue
    create_event
  end

  private

  def create_issue
    @issue = Issue.create(action: @data[:action])
  end

  def create_event
    @event = Event.create(payload: @data, issue_id: @issue.id)
  end
end
