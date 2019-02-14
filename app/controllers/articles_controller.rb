class ArticlesController < ApplicationController
  def index
    @articles = []
    
    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        hits: 20,
      })
      
      results.each do |result|
        book = Article.new(read(result))
        @articles << book
      end
    end
  end
  
  def new
    result = RakutenWebService::Books::Book.search(isbn: params[:format]).first
    @article = current_user.articles.new(read(result))
  end
  
  def create
    result = RakutenWebService::Books::Book.search(isbn: params[:article][:isbn]).first
    @article = current_user.articles.new(read(result))
    @article[:summary] = params[:article][:summary]
    
    if @article.save
      flash[:success] = '投稿が完了しました'
      redirect_to root_url
    else
      flash.now[:danger] = '投稿が失敗しました'
      render :show
    end
  end
  
  def edit
    @article = current_user.articles.find_by(isbn: params[:id])
  end
  
  def update
    @article = current_user.articles.find_by(isbn: params[:article][:isbn])
    summary = params[:article][:summary]
    
    if @article.update(summary: summary)
      flash[:success] = '投稿を編集しました'
      redirect_to toppage_url
    else
      flash[:danger] = '投稿を編集できませんでした'
      render :show
    end
  end

  
  
  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    
    flash[:success] = '要約を削除しました'
    redirect_to root_url
  end
  
  private

  def read(result)
    isbn = result.isbn
    title = result.title
    author = result.author
    publisher_name = result.publisher_name
    itemcaption = result.item_caption
    image_url = result.medium_image_url.gsub("?_ex=120x120", "")
    item_url = result.item_url
    
    {
     isbn: isbn,
     title: title,
     author: author,
     publisher_name: publisher_name,
     itemcaption: itemcaption,
     image_url: image_url,
     item_url: item_url,
    }
  end
end
