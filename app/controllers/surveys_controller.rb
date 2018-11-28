class SurveysController < ApplicationController
  def index
    @surveys = SurveyPost.all
  end

  def new
  end

  def create
    @survey = SurveyPost.new(survey_params)
    @survey.save

    redirect_to surveys_path
  end

  private

  def survey_params
    params.require(:survey_post).permit(:title, :body)
  end
end
