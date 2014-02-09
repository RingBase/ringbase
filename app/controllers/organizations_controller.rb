class OrganizationsController < ApplicationController

  before_filter :must_be_logged_in

  def dashboard
  end
end
