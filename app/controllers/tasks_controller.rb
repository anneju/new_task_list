class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(start_date: :asc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "新增成功"
      redirect_to tasks_path
    else
      flash.now[:error] = "新增失敗"
      render :new
    end
  end

  def edit
    
  end

  def update
    if @task.update(task_params)
      flash[:success] = "已更新"
      redirect_to tasks_path
    else
      flash.now[:error] = "新增失敗"
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "已刪除"
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :content, :start_date, :end_date)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
