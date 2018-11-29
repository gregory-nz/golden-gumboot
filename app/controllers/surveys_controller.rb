class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.save

    redirect_to surveys_path
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :body)
  end
end
