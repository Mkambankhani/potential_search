class DuplicateController < ApplicationController
  def index
  end

  def search
  	 results = SimpleElasticSearch.query("content",params[:query],params[:percentage],params[:size],params[:from])
  	 render :text => {percentage: params[:percentage] , time:results["time"], data: results["data"]}.to_json
  end
end
