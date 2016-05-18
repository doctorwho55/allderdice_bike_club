class NewsPostsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_news_post, only: [:show, :edit, :update, :destroy]

  # GET /news_posts
  # GET /news_posts.json
  def index
    @news_posts = NewsPost.all
  end

  # GET /news_posts/1
  # GET /news_posts/1.json
  def show
  end

  # GET /news_posts/new
  def new
    @news_post = NewsPost.new
  end

  # GET /news_posts/1/edit
  def edit
  end

  # POST /news_posts
  # POST /news_posts.json
  def create
    @news_post = NewsPost.new(news_post_params)
    @news_post.user = current_user

    respond_to do |format|
      if @news_post.save
        format.html { redirect_to @news_post, notice: 'News post was successfully created.' }
        format.json { render :show, status: :created, location: @news_post }
      else
        format.html { render :new }
        format.json { render json: @news_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_posts/1
  # PATCH/PUT /news_posts/1.json
  def update
    respond_to do |format|
      if @news_post.update(news_post_params)
        format.html { redirect_to @news_post, notice: 'News post was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_post }
      else
        format.html { render :edit }
        format.json { render json: @news_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_posts/1
  # DELETE /news_posts/1.json
  def destroy
    @news_post.destroy
    respond_to do |format|
      format.html { redirect_to news_posts_url, notice: 'News post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @news_post.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_post
      @news_post = NewsPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_post_params
      params.require(:news_post).permit(:user_id, :title, :author, :body)
    end
end
