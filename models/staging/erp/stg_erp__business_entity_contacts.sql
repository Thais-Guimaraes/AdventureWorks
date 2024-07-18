with
    source_businessentitycontacts as (
        select
            cast(BUSINESSENTITYID as int) as pk_fk_business_entity_contact_id
            , cast(PERSONID as int) as fk_person_id_business_entity_contact
            , cast(MODIFIEDDATE as date) as modified_date_business_entity_contacts
            , to_number(to_char(cast(MODIFIEDDATE as date), 'YYYYMMDD')) as date_key_business_entity_contacts
        from {{source("erp","businessentitycontact")}}
    )
select *
from source_businessentitycontacts
