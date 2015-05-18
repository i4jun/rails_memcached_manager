class TopController < ApplicationController

  NAMESPACE_LIST = ['sp', 'pc']

  def index
    _valid

    if params[:ns].present? && params[:key].present? && params[:env].present?
      dc = _get_dc
      @value = dc.get(params[:key])
    end
  end

  def delete
    _valid

    @delete_count = 0
    @key_count = 0
    if params[:ns].present? && params[:key].present? && params[:env].present?
      dc = _get_dc

      params[:key].each_line do |key|
        key.strip!
        if key.present?
          @key_count += 1
          result = dc.delete(key)
          @delete_count += 1 if result
        end
      end
    end

    render action: :index
  end

  private
  def _valid
    memservers = MY_APP['memservers']
    params[:mode] = nil if params[:mode].present? && params[:mode] != 'prural'
    params[:ns] = nil if params[:ns].present? && !NAMESPACE_LIST.include?(params[:ns])
    params[:env] = nil if params[:env].present? && !memservers.has_key?(params[:env])
    @namespace_list = NAMESPACE_LIST
    @environment_list = memservers
  end

  def _get_dc
    options = {:namespace => params[:ns], :compress => true, :expires_in => 1.day}
    Dalli::Client.new(@environment_list[params[:env]], options)
  end

end
