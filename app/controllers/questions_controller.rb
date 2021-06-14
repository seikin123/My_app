class QuestionsController < ApplicationController

  def new
    @register_quiz_form = RegisterQuizForm.new
  end

  def create
    @register_quiz_form = RegisterQuizForm.new(create_question_params)
    if @register_quiz_form.save
      redirect_to (成功したときのパス)
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
