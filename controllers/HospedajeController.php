<?php

require_once '../models/Hospedaje.php';
require_once '../models/Hotel.php';
require_once '../models/Apartment.php';
require_once '../models/City.php';
require_once '../models/Province.php';
require_once '../models/RoomType.php';

class HospedajeController
{
    private $hospedaje;
    private $hotel;
    private $apartment;
    private $city;
    private $province;
    private $roomType;

    public function __construct()
    {
        $this->hospedaje = new Hospedaje();
        $this->hotel = new Hotel();
        $this->apartment = new Apartment();
        $this->city = new City();
        $this->province = new Province();
        $this->roomType = new RoomType();
    }

    public function index()
    {
        $prefix = isset($_GET['prefix']) ? $_GET['prefix'] : '';
        $hospedajes = $this->hospedaje->findHospedajesByPrefix($prefix);
        $results = [];

        foreach ($hospedajes as $hospedaje) {
            $city = $this->city->getCityName($hospedaje['city_id']);
            $province = $this->province->getProvinceName($city['province_id']);
            $details = [];

            if ($hospedaje['type'] == 'hotel') {
                $hotelDetails = $this->hotel->getHotelDetails($hospedaje['id']);
                $roomType = $this->roomType->getRoomTypeName($hotelDetails['room_type_id']);
                $details = [
                    'stars' => $hotelDetails['stars'],
                    'room_type' => $roomType,
                ];
            } else {
                $apartmentDetails = $this->apartment->getApartmentDetails($hospedaje['id']);
                $details = [
                    'total_apartments' => $apartmentDetails['total_apartments'],
                    'max_adults' => $apartmentDetails['max_adults'],
                ];
            }

            $results[] = [
                'name' => $hospedaje['name'],
                'type' => $hospedaje['type'],
                'details' => $details,
                'city' => $city['name'],
                'province' => $province,
            ];
        }

        include '../views/hospedajes.php';
    }
}
?>