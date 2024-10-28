class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to @schedule, notice: 'スケジュールが作成されました。'
    else
      flash.now[:alert] = "エラー: " + @schedule.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to @schedule, notice: 'スケジュールが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, notice: 'スケジュールが削除されました。'
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :description, :date, :start_time, :end_time, :all_day)
  end
end