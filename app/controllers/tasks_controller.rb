class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(created_at: :asc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "已新增任務"
    else
      render :new
      flash[:notice] = "新增失敗"
    end
  end

  def edit
    
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "已更新"
    else
      render :edit
      flash[:notice] = "更新失敗"
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "已刪除"
  end

  private
  def task_params
    params.require(:task).permit(:name, :content)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
