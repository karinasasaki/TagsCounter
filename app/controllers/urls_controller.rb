require 'net/http'

class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def create
    links = url_params[:link].gsub(/[\n|,\s|;]/, " ").split
    links.each do |link|
      @url = Url.create(link: "https://#{link}")
      p html = Net::HTTP.get(URI("https://#{link}"))
      count_tags(html)
    end
    
    redirect_to root_path
  end

  def count_tags(html)
    tags = html.scan(/<([a-z]+)(?=[\s>])(?:[^>=]|='[^']*'|="[^"]*"|=[^'"\s]*)*\s?\/?>/)
    tags.uniq.each do |tag|
      Tag.create(name: tag.to_s.gsub(/"|\[|\]/, ""), quantity: tags.count(tag), url: @url)
    end
  end

  def edit
    @url = Url.find(params[:id])
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def url_params
      params.require(:url).permit(:link)
    end
end
