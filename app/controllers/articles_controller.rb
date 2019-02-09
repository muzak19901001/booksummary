class ArticlesController < ApplicationController
  def new
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
  
  def show
  end
  
  private
  
  def read(result)
    isbn = result['isbn']
    title = result['title']
    author = result['author']
    publisher_name = result['publisherName']
    itemcaption = result['itemCaption']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')
    item_url = result['itemUrl']
    
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
