class QuestionsController < ApplicationController
  # ログインをしていないとログイン画面に遷移
  before_action :authenticate_user!, only: [ :new, :show, :create, :edit, :update, :destroy ]
  # 編集、更新、削除は本人のみ
  before_action :correct_user, only: [ :edit, :update, :destroy ]
  # 質問一覧表示
  def index
    @questions = Question.all
  end


  # 質問詳細ページ表示
  def show
    @question = Question.find(params[:id])
  end

  # 質問の作成
  def new
    @question = Question.new
  end

  # 質問の登録
  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render "new", status: :unprocessable_entity
    end
  end

  # 質問の編集
  def edit
    @question = Question.find(params[:id])
  end

  # 質問の更新
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render "edit", status: :unprocessable_entity
    end
  end

  # 質問の削除
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to question_path, notice: "削除しました"
  end

  private

  def correct_user
    @question = Question.find(params[:id])
    redirect_to questions_path, alert: "権限がありません" unless @question.user == current_user
  end









  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
