# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WebhooksController, type: :controller do
  let(:json) { JSON.parse(response.body).with_indifferent_access }
end
