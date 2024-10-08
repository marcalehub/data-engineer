----------------------------------------------------------------------------------------------------
--Regular Expression--
----------------------------------------------------------------------------------------------------
select distinct
    text_fiel,
    regexp_substr(text_field, '([A-Z])+(\d{1})?(\d{4}|\d{3}|\d{2})', 1, 1, 'c', 2) as "Expression",
    regexp_replace(digit_field, '(\d)(\d{2})(\d{2})(\d{2})', '\3/\4/\2') as "Expression "

from  
    table

where
    regexp_like(text_field, '([A-Z])+(\d{1})?(\d{4}|\d{3}|\d{2})')