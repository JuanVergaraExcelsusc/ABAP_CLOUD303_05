@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZCDD_L_CLIENTES05
  as select from ztb_l_clientes05 as clientes
    inner join   ztb_l_clnt_lib05 as RELCLIB on RELCLIB.id_cliente = clientes.id_cliente
{
  key RELCLIB.id_libro     as idlibro,
  key clientes.id_cliente  as IdCliente,
      //  key clientes.tipo_acceso as TipoAcceso,
  key clientes.tipo_acceso as Acceso,
      clientes.nombre      as Nombre,
      clientes.apellidos   as Apellidos,
      clientes.email       as Email,
      clientes.url         as Imagen
}
