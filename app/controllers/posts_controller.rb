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
    if current_user != @post.user
      redirect_to root_path, notice: "권한이 없습니다."
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '새 글이 작성 되었습니다.' }
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
        format.html { redirect_to @post, notice: '글이 수정되었습니다.' }
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
      format.html { redirect_to posts_url, notice: '글이 삭제 되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: "해당 글은 더이상 존재하지 않습니다."

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
