class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @categories = Category.all
    
    if(params.has_key?(:category_name) && params[:category_name] != "All")
      # puts params[:category_name]
      category_id = Category.where(name: params[:category_name])
      @posts = Post.where(category_id: category_id).order(created_at: :desc).page(params[:page])
    else
      @posts = Post.order(created_at: :desc).page(params[:page])
    end
  end

  def show
    @cagetories = Category.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: "The post does not exist anymore."

    end

    def post_params
      params.require(:post).permit(
        :title,
        :description, 
        :category_id, 
        :telegram, 
        :whatsapp, 
        :discord, 
        :slack, 
        :others,
        :location_id => [])
    end
end
