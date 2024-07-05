@EndUserText.label: 'Travel - Interface'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define root view entity ZI_TRAVEL303_05_A
  provider contract transactional_interface
  as projection on ZR_TRAVEL303_05_A
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangeBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZI_BOOKINGS303_05A,
      _Currency,
      _Customer,
      _OverallStatus
}
