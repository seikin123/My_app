class RegisterQuizForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :question_content, :string
  attribute :correct_choice, :string
  attribute :incorrect_choice_1, :string
  attribute :incorrect_choice_2, :string
  attribute :incorrect_choice_3, :string

  validates :question_content, presence: true, length: { maximum: 140 }
  validates :correct_choice, presence: true, length: { maximum: 40 }
  validates :incorrect_choice_1, presence: true, length: { maximum: 40 }
  validates :incorrect_choce_2, length: { maximum: 40 }
  validates :incorrect_choice_3, length: { maximum: 40 }

  def save
    return false unless valid?
    question = Question.new(content: question_content)
    question.save # 問題文の登録

    choice = question.choices.build(content: correct_choice, is_answer: true)
    choice.save # 正解選択肢の保存

    question.choices.create(content: incorrect_choice_1, is_answer: false)
    question.choices.create(content: incorrect_choice_2, is_answer: false)
    question.choices.create(content: incorrect_choice_3, is_answer: false)
    # 不正解選択肢の登録
  end
end