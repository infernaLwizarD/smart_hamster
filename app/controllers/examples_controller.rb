class ExamplesController < ApplicationController
  respond_to :html, :json
  before_action :find_and_authorize_example, except: %i[new create index]

  def index
    authorize Example

    @examples = Example.all
    @examples_cnt = @examples.count

    respond_with @examples
  end

  def show
    respond_with @example
  end

  def new
    @example = Example.new

    respond_with @example
  end

  def edit
  end

  def create
    @example = Example.new(example_params)
    @example.save

    respond_with @example
  end

  def update
    if @example.update(example_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @example.destroy

    respond_with @example
  end

  private

  def find_and_authorize_example
    @example = Example.find(params[:id])
    authorize @example
  end

  def example_params
    attributes = [:math_training_id, :text, :user_result, :correct_result, :end_time]
    params.require(:example).permit(attributes)
  end
end
