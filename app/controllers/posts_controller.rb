class PostsController < ApplicationController
# rescue ActiveRecord::RecordNotFound, with: :render_not_found_response
# rescue ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post
  rescue ActiveRecord::RecordInvalid => invalid
    render json: {errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private

  # def render_unprocessable_entity(invalid)
  #   render json: {errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  # end

  # def render_not_found_response(invalid)
  #   render json: {errors: invalid.record.errors.full_messages }, status: :not_found
  # end

  def post_params
    params.permit(:category, :content, :title)
  end

end
