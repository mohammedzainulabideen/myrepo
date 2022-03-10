using Iquote as service from '../../srv/admin-service';

annotate Iquote.Books with @(

  Search:{searchable:false},
UI:{

HeaderInfo  : {
    $Type : 'UI.HeaderInfoType',
    TypeName : 'Details',
    TypeNamePlural : 'Details',
    Title: { $Type: 'UI.DataField', Value: title },
    Description: {$Type: 'UI.DataField', Value: author.name, Label: 'Author Name'}
},

SelectionFields  : [
 ID,title,stock
],

HeaderFacets  : [
    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#bookdet' },
        {$Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Stock'}
],
Facets  : [
   {
        $Type: 'UI.CollectionFacet',
        Label: 'General Information',
        Facets: [
            {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Description'},
          ]



   },
  {$Type: 'UI.ReferenceFacet', Label: 'AUTHOR DETAILS', Target: '@UI.FieldGroup#auth'}
    
],
LineItem  : [
    {$Type: 'UI.DataField', Value: ID, Label:'BookId'},
    {$Type: 'UI.DataField', Value: price, Label:'Price'},
   // {$Type: 'UI.DataFieldForAnnotation',Criticality : stock, Target : '@UI.DataPoint#Progress', Label:'Stock'},
    //{$Type: 'UI.DataField', Value: currency_code, Label:'Currency'},
    {$Type: 'UI.DataField', Value: title},
    {$Type: 'UI.DataField', Value: author.name, Label: 'Author Name'}



    
],
DataPoint#Stock : {
    $Type : 'UI.DataPointType',
    Value : stock,
    
},
DataPoint#Progress : {
    $Type : 'UI.DataPointType',
    Value : stock,
    TargetValue : 200,
    Visualization : #Progress

},
FieldGroup#bookdet : {
    $Type : 'UI.FieldGroupType',
    Data:[
        {$Type: 'UI.DataField', Value: descr},
          {$Type: 'UI.DataField', Value: price}
    ]
    
},
FieldGroup#Description : {
    $Type : 'UI.FieldGroupType',
    Data:[
        {$Type: 'UI.DataField', Value: ID},
          {$Type: 'UI.DataField', Value:title}

    ]
    
},

FieldGroup#auth : {
    $Type : 'UI.FieldGroupType',
    Data:[
        {$Type: 'UI.DataField', Value: author.name, Label: 'Author Name'},
          {$Type: 'UI.DataField', Value:author.ID, Label: 'Author ID'}

    ]
},
},



 













);
annotate Iquote.Books with {
    @Common.Label : 'Currency'
    @Common : {
        Text            : currency.name,
        TextArrangement : #TextOnly
    }
    @Common.ValueListWithFixedValues : true
    @Common.ValueList : {
        $Type : 'Common.ValueListType',
        Label : 'Currency',
        CollectionPath : 'Currencies',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : currency_code,
                ValueListProperty : 'code'
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
        ]
    }
    @Core.Description : 'A currency code as specified in ISO 4217'
    currency_code
};

annotate Iquote.Books with {
    @Common.Label : 'Title'
    @Common : {
        Text            : title,
        TextArrangement : #TextOnly
    }
  //  @Common.ValueListWithFixedValues : true
    @Common.ValueList : {
        $Type : 'Common.ValueListType',
        Label : 'Titles',
        CollectionPath : 'Books',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : title,
                ValueListProperty : 'title'
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'stock'
            }
        ]
    }
   
    title
};


