class Api::V1::SecondsController < Api::V1::GraphitiController
  def index
    seconds = SecondResource.all(params)
    respond_with(seconds)
  end

  def show
    second = SecondResource.find(params)
    respond_with(second)
  end

  def create
    second = SecondResource.build(params)

    if second.save
      render jsonapi: second, status: :created
    else
      render jsonapi_errors: second
    end
  end

  def update
    second = SecondResource.find(params)

    if second.update_attributes
      render jsonapi: second
    else
      render jsonapi_errors: second
    end
  end

  def destroy
    second = SecondResource.find(params)

    if second.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: second
    end
  end
end
