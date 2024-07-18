with
    source_people as (
        select
            cast(BUSINESSENTITYID as int) as pk_fk_business_entity_people_id,
            coalesce(nullif(trim(PERSONTYPE), ''), 'N/A') as person_type,
            coalesce(nullif(trim(FIRSTNAME), ''), 'N/A') || ' ' || coalesce(nullif(trim(LASTNAME), ''), 'N/A') as nm_person,
            cast(EMAILPROMOTION as boolean) as email_promotion,
            cast(MODIFIEDDATE as date) as modified_date_person,
            to_number(to_char(cast(MODIFIEDDATE as date), 'YYYYMMDD')) as date_key_person
        from {{ source("erp", "person") }}
    )
select *
from source_people
