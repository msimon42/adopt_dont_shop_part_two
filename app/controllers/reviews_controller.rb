class ReviewsController < ApplicationController
  def new
    @shelter_id = params[:id]
  end

  def create
    @new_review = shelter.reviews.create(review_params)
    if @new_review.save
      flash[:happy] = 'Review submitted successfully.'
      redirect_to "/shelters/#{shelter.id}"
    else
      flash[:sad] = 'Failed to submit review. Be sure to provide all required information.'
      redirect_back fallback_location: "/shelters/#{shelter.id}/new-review"
    end
  end

  def show
    @review = Review.find(params[:id])
    redirect_to "/shelters/#{@review.shelter_id}"
  end

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    if review.save
      flash[:happy] = 'Review Updated Successfully'
      redirect_to "/shelters/#{review.shelter_id}"
    else
      flash[:sad] = 'Failed to update review. Be sure to provide all required information.'
      render :new
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to "/shelters/#{review.shelter_id}"
  end

  private

  def review_params
    params.permit(:title, :content, :rating, :image)
  end

  def review
    Review.find(params[:id])
  end

  def shelter
    Shelter.find(params[:id])
  end
end
