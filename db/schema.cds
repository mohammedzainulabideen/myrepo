namespace com.sap.iquote;
using {Currency , managed,cuid} from '@sap/cds/common';


entity Books{
    
    @Common.Label : 'BooksId'
 key ID   : Integer;
 @Common.Label : 'Title'
 
  title    : localized String(111);
  descr    : localized String(1111);
  author   : Association to Authors;

  stock    : Integer;
  price    : Decimal(9,2);
  @Common.Label : 'Currency'
   @Common.ValueListWithFixedValues : true
  currency: Currency;
 //  currencycode: String;
  // Priority: String;

}
entity Authors {
  key ID   : Integer;
  name     : String(111);
  books    : Association to many Books on books.author = $self;
}


 
