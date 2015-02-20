require 'test_helper'

class MarkersHelperTest < ActionView::TestCase
	test "marker_contnent requres content " do
		marker = Marker.new
		assert !marker.save
		assert !marker.errors[:marker_content].empty?
	end

	test "marker content should be at least 5 letters long" do
		marker = Marker.new
		marker.marker_content = "hi"
		assert !marker.save
		assert !marker.errors[:marker_content].empty?
	end

	test "marker shoudl have a user id" do
		marker = Marker.new
		marker.marker_content = "Hifjdsklafj ldsajf"
		assert !marker.save
		assert !marker.errors[:user_id].empty?

	end
end
