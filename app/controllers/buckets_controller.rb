class BucketsController < ApplicationController

	before_action :find_bucket, only: [:show, :edit, :update, :destroy]

	def index
		@buckets = Bucket.all.order("created_at DESC")
	end	

	def show
	end

	def new
		@bucket = current_user.buckets.build
	end

	def create
		@bucket = current_user.buckets.build(bucket_params)

		if @bucket.save
			redirect_to @bucket, notice: "Successfully created new Bucket"

		else
			render 'new'
		end
	end

	def update
		if @bucket.update(bucket_params)
			redirect_to @bucket, notice: "Bucket was Successfully updated!"

		else
			render 'edit'
		end
	end

	def destroy
		@bucket.destroy
		redirect_to root_path
	end


	private

	def bucket_params
		params.require(:bucket).permit(:title, :description, :image)
	end

	def find_bucket
		@bucket = Bucket.find(params[:id])
	end
	
end
