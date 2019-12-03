class ReviewsController < ApplicationController
  def new
    @shelter_id = params[:id]
  end

  def create
    @shelter_id = params[:id]
    @new_review = Review.create(
      title: params[:title],
      content: params[:comment],
      rating: params[:rating],
      image: params[:image],
      created_at: Time.now,
      shelter_id: @shelter_id
    )

    @new_review.save
    redirect_to "/shelters/#{@shelter_id}"
  end
end
