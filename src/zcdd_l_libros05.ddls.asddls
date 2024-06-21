@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZCDD_L_LIBROS05
  as select from    ztb_l_libros05    as libros
    inner join      ztb_l_categ05     as categ  on libros.bi_categ = categ.bi_categ
    left outer join zcdd_l_clnt_lib05 as Ventas on libros.id_libro = Ventas.id_libro
  association [0..*] to ZCDD_L_CLIENTES05 as _clientes on $projection.IdLibro = _clientes.idlibro
{
      //      @UI:{
      //      facet: [{ id: 'DetallesLibro',
      //                label: 'Detalles del Libro',
      //                type: #COLLECTION,
      //                position: 10 },
      //
      //              { id: 'Libro',
      //              parentId: 'DetallesLibro',
      //              label: 'Detalles',
      //              type: #FIELDGROUP_REFERENCE,
      //              targetQualifier: 'DetallesLibro',
      //              position: 20
      //
      //              }
      //              ]
      //      }
  key libros.id_libro   as IdLibro,
//      libros.bi_categ   as BiCateg,
      libros.bi_categ   as Categoria,
      libros.titulo     as Titulo,
      libros.autor      as Autor,
      libros.editorial  as Editorial,
      libros.idioma     as Idioma,
      libros.paginas    as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      libros.precio     as Precio,
      libros.moneda     as Moneda,
      case
      when Ventas.ventas <= 10 then 1
      when Ventas.ventas = 2 then 2
      when Ventas.ventas > 2 then 3
      else 1
      end               as Ventas,

      case Ventas.ventas
      when 0 then ''
      else ''
      end               as text,

      libros.formato    as Formato,
      categ.descripcion as Descripcion,
      libros.url        as Imagen,
      _clientes
}
