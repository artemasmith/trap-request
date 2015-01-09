class RequestsController < ApplicationController

  def show
    if params[:id].present?
      @request = Trap.find(params[:id].to_i)
    else
      @requests = Trap.where('name = ?', params[:trap_id]).order('created_at DESC')
      if @requests.blank?
        flash[:error] = t('wrong_url')
        redirect_to instruction_path
      end
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def index
  end

  def create
    rq = Trap.new
    Trap::RPARAMS.each do |p|
      rq[p] = request.send(p)
    end
    rq.name = params[:trap_id]
    rq.query_params = params
    rq.raw_data = request.raw_post()
    rq.headers = request.headers.map{|k,v| "#{k} #{v}"}.join(';')
    if rq.save
      render nothing: true, status: 200
    else
      render nothing: true, status: 500
    end
  end


end
