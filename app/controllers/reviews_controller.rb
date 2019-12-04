class ReviewsController < ApplicationController
  def new
    @shelter_id = params[:id]
  end

  def create
    @shelter = Shelter.find(params[:id])
    @new_review = @shelter.reviews.create(review_params)
    if @new_review.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:sad] = 'You have not entered all required information.'
      render :new
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
    @review = Review.find(params[:id])
    @review.update(review_params)
    @review.save
    redirect_to "/shelters/#{@review.shelter_id}"
  end

  private

  def review_params
    params.permit(:title, :content, :rating, :image)
  end
end
