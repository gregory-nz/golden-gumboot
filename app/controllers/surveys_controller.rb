class SurveysController < ApplicationController
  def index
    if logged_in?
      @surveys = current_user.surveys
    else
      redirect_to login_path
    end
  end

  def new
  end

  def create
    @survey = current_user.surveys.new(survey_params)
    if @survey.save
      redirect_to surveys_path
    else
      render 'new'
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to root_path
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :body)
  end
end
