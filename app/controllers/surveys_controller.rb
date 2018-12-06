class SurveysController < ApplicationController
  before_action :login_redirect
  before_action :find_survey, only: [:show, :edit, :update, :destroy]
  def index
    @surveys = current_user.surveys
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = current_user.surveys.new(survey_params)
    if @survey.save
      flash[:success] = "Survey successfully created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @survey.update(survey_params)
      flash[:success] = "Survey successfully updated!"
      redirect_to @survey
    else
      flash[:danger] = "Failed to edit form!"
      render 'edit'
    end
  end

  def destroy
    @survey.destroy
    flash[:danger] = @survey.title + " successfully deleted"
    redirect_to root_path
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :body, questions_attributes: [:id, :question, :_destroy])
  end

  def login_redirect
    redirect_to login_path unless logged_in?
  end

  def find_survey
    @survey = current_user.surveys.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "Survey not found!"
    redirect_to root_path
  end
end
