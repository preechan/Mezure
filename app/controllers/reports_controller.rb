require 'mailchimp'

class ReportsController < ApplicationController

  def index
    @channel = Channel.find(params[:channel_id])
    @mc = Mailchimp::API.new(@channel.apiKey)
    campaigns_res = @mc.campaigns.list({:status=>'sent'})
    begin
      @campaigns = campaigns_res['data']
    rescue Mailchimp::Error => ex
      if ex.message
        flash[:error] = ex.message
      else
        flash[:error] = "An unknown error occurred"
      end
      redirect_to '/'
    end
  end

  def view
    @mc = Mailchimp::API.new('5363cfc1ee6d2b4f6e563bda9eea4ee9-us4')
    begin
      campaign_id = params[:id]
      campaign_res = @mc.campaigns.list({:campaign_id => campaign_id})
      @campaign = campaign_res['data'][0]
      @report = @mc.reports.summary(campaign_id)
    #rescue Mailchimp::CampaignDoesNotExistError
    #  flash[:error] = "Campaign does not exist"
    #  redirect_to '/reports/'
    rescue Mailchimp::Error => ex
      if ex.message
        flash[:error] = ex.message
      else
        flash[:error] = "An unknown error occurred"
      end
      redirect_to '/reports'
    end
  end


end
