class EntriesController < ApplicationController
  def index
    @entries = Entry.all.order('date ASC')
  end

  def show
    @entry = Entry.find params[:id]
  end

  def new
  end

  def create
    entry_params = params["entry"].permit("title", :contents)
    entry = Entry.new(entry_params)
    if entry.save
      redirect_to(entry_path(entry))
      flash[:success] = "udało się"
    else
      render :new
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    entry_params = params[:entry].permit(:title, :contents)
    entry = Entry.find(params[:id])
    entry.update(entry_params)
    redirect_to(entry_path(entry))

  end
end
