class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @task = current_user.tasks.build
      @pagy, @tasks = pagy(current_user.tasks.order(id: :desc))
    end
  end
  
  def show
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクが追加されました"
      redirect_to root_url
    else
      flash.now[:danger] = "タスクが追加されませんでした"
      render "tasks/index"
    end
  end
  
  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "タスクは更新されました"
      redirect_to root_url
    else
      flash.now[:danger] = "タスクは更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = "タスクは削除されました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
