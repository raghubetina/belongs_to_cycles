class Api::V1::FirstsController < Api::V1::GraphitiController
  def index
    firsts = FirstResource.all(params)
    respond_with(firsts)
  end

  def show
    first = FirstResource.find(params)
    respond_with(first)
  end

  def create
    first = FirstResource.build(params)

    if first.save
      render jsonapi: first, status: 201
    else
      render jsonapi_errors: first
    end
  end

  def update
    first = FirstResource.find(params)

    if first.update_attributes
      render jsonapi: first
    else
      render jsonapi_errors: first
    end
  end

  def destroy
    first = FirstResource.find(params)

    if first.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: first
    end
  end
end
