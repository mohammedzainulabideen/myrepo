using { com.sap.iquote as my } from '../db/schema';

using API_BUSINESS_PARTNER from './external/API_BUSINESS_PARTNER.csn';



@_requires : 'admin'
service Iquote
{
    
    @odata.draft.enabled
    entity Books as
        projection on my.Books;

    entity Authors as
        projection on my.Authors;
}
