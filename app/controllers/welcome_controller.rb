# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:nome]
    @curso = params[:curso]
  end
end
