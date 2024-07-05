@EndUserText.label: 'BOOKING SUPPLEMENTS - INTERFASE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_BOOKSUPPL303_05_A
  as projection on zr_booksuppl303_05_a
{
  key BookSupplUUID,
      TravelUUID,
      BookingUUID,
      BookingSupplementID,
      SupplementID,
      BookSupplPrice,
      CurrencyCode,
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent zi_bookings303_05a,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZI_TRAVEL303_05_A
}
