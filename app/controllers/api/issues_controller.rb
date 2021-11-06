module Api
  class IssuesController < ApplicationController
    before_action :set_api_issue, only: [:show, :update, :destroy]

    # GET /api/issues
    def index
      @issues = Issue.all

      render json: @issues
    end

    # GET /api/issues/1
    def show
      render json: @issue
    end

    # POST /api/issues
    def create
      @issue = Issue.new(api_issue_params)

      if @issue.save
        render json: @issue, status: :created, location: @issue
      else
        render json: @issue.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/issues/1
    def update
      if @issue.update(api_issue_params)
        render json: @issue
      else
        render json: @issue.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/issues/1
    def destroy
      @issue.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_api_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_issue_params
      params.fetch(:api_issue, {})
    end
  end
end
