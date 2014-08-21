class TagsController < ApplicationController

	def show
		# id = params[:id]
		# @tag = Tag.find(id)

		#when entered only below, says can't find tag without an ID
		name = params[:name]
		@tag = Tag.find_by_name(name)
	end

end
