class SettingsController < ApplicationController

  layout 'settings_layout'

  respond_to :html, :json, :js

  # GET /settings
  def index

  end

  # GET /settings/seats_agenda
  def seats
    @seats = Seat.all
    respond_with(@seats)
  end


end
