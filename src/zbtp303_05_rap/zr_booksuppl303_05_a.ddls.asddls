@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOOKING SUPPLEMENTS - ROOT'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zr_booksuppl303_05_a
  as select from zbksuppl303_05_a

  association        to parent zr_bookings303_05a as _Booking        on $projection.BookingUUID = _Booking.BookingUUID
  association [1..1] to ZR_TRAVEL303_05_A         as _Travel         on $projection.TravelUUID = _Travel.TravelUUID

  association [1..1] to /DMO/I_Supplement         as _Product        on $projection.SupplementID = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText     as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID
{
  key booksuppl_uuid        as BookSupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,

      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as BookSupplPrice,
      currency_code         as CurrencyCode,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,


      _Travel,
      _Booking,
      _Product,
      _SupplementText
}
