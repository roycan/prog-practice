class PagesController < ApplicationController

include PagesHelper


  def caesar_problem
  end

  def caesar_solve
    @input = params[:input]
    @output = "1234"
    @output = caesar_cipher(@input)
    flash[:io] = [@input, @output]
    redirect_to caesar_show_path
  end

  def caesar_show
    @input = flash[:io][0]
    @output = flash[:io][1]
  end


  def stock_problem
  end

  def stock_solve
    @input = params[:input]
    @output = "1234"
    @output = stock_picker(@input)
    flash[:io] = [@input, @output]
    redirect_to stock_show_path
  end

  def stock_show
    @input = flash[:io][0]
    @output = flash[:io][1]
  end


  def substrings_problem
  end

  def substrings_solve
    @input = params[:input]
    @output = "1234"
    @output = substrings(@input)
    flash[:io] = [@input, @output]
    redirect_to substrings_show_path
  end

  def substrings_show
    @input = flash[:io][0]
    @output = flash[:io][1]
  end






end
