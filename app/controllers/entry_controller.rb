class EntryController < ApplicationController

  def create
    @entry = Entry.new(person_params)
  end

private

  def entry_params
    params.require(:entry).permit(:recipient, :total)
  end
end
