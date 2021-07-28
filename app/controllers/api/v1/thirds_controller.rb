class Api::V1::ThirdsController < Api::V1::GraphitiController
  def index
    thirds = ThirdResource.all(params)
    respond_with(thirds)
  end

  def show
    third = ThirdResource.find(params)
    respond_with(third)
  end

  def create
    third = ThirdResource.build(params)

    if third.save
      render jsonapi: third, status: 201
    else
      render jsonapi_errors: third
    end
  end

  def update
    third = ThirdResource.find(params)

    if third.update_attributes
      render jsonapi: third
    else
      render jsonapi_errors: third
    end
  end

  def destroy
    third = ThirdResource.find(params)

    if third.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: third
    end
  end
end
