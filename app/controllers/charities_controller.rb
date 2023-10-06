class CharitiesController < ApplicationController
  before_action :authenticate_user!, only: [:apply, :edit, :update, :donors, :donations, :stories, :beneficiaries, :automated_donations]

  def apply
  end

  def edit
  end

  def update
  end

  def donors
  end

  def donations
  end

  def stories
  end

  def beneficiaries
  end

  def automated_donations
  end
end
