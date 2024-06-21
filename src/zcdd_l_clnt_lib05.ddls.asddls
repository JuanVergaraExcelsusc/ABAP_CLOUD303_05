@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes Libros - Ventas'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcdd_l_clnt_lib05
  as select from ztb_l_clnt_lib05
{
  key id_libro                    as id_libro,
      count( distinct id_cliente) as ventas
}
group by
  id_libro;
