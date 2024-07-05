@EndUserText.label: 'BOOKING - INTERFASE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_BOOKINGS303_05A
  as projection on zr_bookings303_05a
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LocalLastChangeAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child zi_booksuppl303_05_a,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZI_TRAVEL303_05_A
}
