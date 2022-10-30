class MathTrainingsController < ApplicationController
  respond_to :html, :json
  before_action :find_and_authorize_math_training, except: %i[new create index]

  def index
    authorize MathTraining

    @math_trainings = MathTraining.all
    @math_trainings_cnt = @math_trainings.count

    respond_with @math_trainings
  end

  def show
    respond_with @math_training
  end

  def new
    @math_training = MathTraining.new

    respond_with @math_training
  end

  def edit
  end

  def create
    @math_training = MathTraining.new(math_training_params)
    @math_training.save

    respond_with @math_training
  end

  def update
    if @math_training.update(math_training_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @math_training.destroy
    respond_with @math_training
  end

  private

  def find_and_authorize_math_training
    @math_training = MathTraining.find(params[:id])
    authorize @math_training
  end

  def math_training_params
    attributes = [:user_id, :min_number, :max_number, :timer, { operations: [] }]
    params.require(:math_training).permit(attributes)
  end
end
