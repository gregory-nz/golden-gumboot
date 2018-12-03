class SurveysController < ApplicationController
  def index
    if logged_in?
      @surveys = current_user.survey
    else
      redirect_to login_path
    end
  end

  def new
  end

  def create
    @survey = current_user.survey.new(survey_params)
    if @survey.save
      redirect_to surveys_path
    else
      render 'new'
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :body)
  end
end
