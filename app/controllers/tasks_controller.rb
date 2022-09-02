class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = current_user.tasks.recent
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end  

  def update
    task.update!(task_params)
    redirect_to tasks_path, notice: "タスク「#{task.name}」を更新しました"
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。" #tasks_urlをtasks_pathに変えた
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスク「#{@task.name}」を削除しました"
  end
  
  private

  def task_params
    params.require(:task).permit(:name, :description) #taskパラメーターの中のname,descriprtionパラメータのみ許可
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
  
end
