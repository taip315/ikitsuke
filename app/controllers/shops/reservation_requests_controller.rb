class Shops::ReservationRequestsController < ApplicationController

  def index
    @reservation_requests = current_shop.reservation_requests.all
  end

  def reserve_allow
    request = ReservationRequest.find(params[:id])
    Reservation.create( 
      start_time: request.start_time,
      number_of_people: request.number_of_people,
      remarks: request.remarks,
      user_id: request.user_id,
      shop_id: request.shop_id
    )
    request.destroy
    redirect_back(fallback_location: shops_shop_reservation_requests_path(current_shop.id))
  end

  def destroy
    reservation_request = ReservationRequest.find(params[:id])
    reservation_request.destroy
    redirect_back(fallback_location: shops_shop_reservation_requests_path(current_shop.id))
  end

end
