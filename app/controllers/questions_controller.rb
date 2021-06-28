class QuestionsController < ApplicationController

  def new
    @register_quiz_form = RegisterQuizForm.new
  end

  def index
    @questions = Question.all
    @choices = Choice.all
  end

  def show
    # quiz_data = Question.create_with(10) #ランダムに問題が出るかなと思ったが、仕組みを理解できていないのでコメントあうと
    @question = Question.find(params[:id])
    @choices = @question.choices
    # @choices = Choice.all
  end

  def create
    @register_quiz_form = RegisterQuizForm.new(create_question_params)
    if @register_quiz_form.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def create_question_params
    params.require(:register_quiz_form).permit(
      :question_content, :correct_choice, 
      :incorrect_choice_1, :incorrect_choice_2, :incorrect_choice_3)
  end
end
